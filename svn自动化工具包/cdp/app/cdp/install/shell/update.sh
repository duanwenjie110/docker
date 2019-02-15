#! /bin/bash

#仓库地址
res_addr="$1:$4"
#目标机器ip
ip=$2
#目标机器用户名
user=$3
#服务名称
service_name=$5
#退格功能
stty erase ^H
#检验上一个功能是否执行的函数
checkFunctions (){
if [ $? -ne 0 ] 
then
	echo "comond execute fail"
	exit	
fi
}
#$1$2当前版本和仓库有的版本做比较保留高版本
compareVersion(){
voldVal="${1:1:1}${1:3:1}${1:5:1}"
holdVal="${1:7:1}${1:9:1}${1:11:1}"
vnewVal="${2:2:1}${2:4:1}${2:6:1}"
hnewVal="${2:8:1}${2:10:1}${2:12:1}"
#echo $1
#echo $2
#echo $voldVal
#echo $holdVal
#echo $vnewVal
#echo $hnewVal
if [ $vnewVal -gt $voldVal ]
     then
        return 1
else
   if [ $hnewVal -gt $holdVal ]
       then
         return 1
       else
         return 0 
   fi
fi

}
#获取挂载路径包含[]两个括号
configload=$(ssh $user@$ip docker inspect -f '{{.HostConfig.Binds}}' $service_name)
#切割[]获取里面字符串
configload_arr=`echo $configload|cut -d '[' -f2|cut -d ']' -f1`
#根据空格截取获取数组
carr=${configload_arr// / }
configarr=($carr)
#遍历数组加-v拼接路径
loadaddr=""
for i in `seq 0 $((${#configarr[*]}-1))`
do        
       loadaddr="$loadaddr -v ${configarr[${i}]}"
done
echo $loadaddr
#获取当前运行的镜像版本

echo "get current images version start"
currentVersion=$(ssh $user@$ip docker ps -a |grep $service_name| awk '{print $(2)}')
str=${currentVersion//:/ }
arrs=($str);
currentV=${arrs[2]}
echo $currentV

#从远程仓库啦镜像
dockerResult=$(curl -s $res_addr/v2/_catalog )
if  [[ $dockerResult ]]
	then
	echo "remote $res_addr  docker repository usable"
	else
	echo "remote $res_addr  docker repository confuse connect"
exit -1
fi
#大写转成小写变成镜像名字
typeset -l serviceName
serviceName=$service_name
#echo "$serviceName--------------------------------"
if [[ $service_name == *dsahkuhd*  ]]
        then
        sname=$serviceName
        str=${sname//-/ }
        dsahkuhdName=($str)
        version=$(curl -s $res_addr/v2/${dsahkuhdName[0]}/tags/list)
        else        
        version=$(curl -s $res_addr/v2/$serviceName/tags/list)
fi
#远程仓库镜像版本显示
if [[ $version != *errors*  ]]
	then
	echo "docker repository $service_name's version list"
	else
         
	echo "docker repository $service_name's version not found ,exit"
exit -1
fi

#选择远程仓库镜像数组排除低版本保留高版本
version_arr=`echo $version|cut -d '[' -f2|cut -d ']' -f1`
str=${version_arr//,/ }
val=($str)
j=-1
for i in `seq 0 $((${#val[*]}-1))`
do    
     #echo $currentV
     #echo ${val[${i}]}
     compareVersion $currentV ${val[${i}]}
     if [ $? -eq 1 ]
     then
            j=$[j+1]
            new_val[$j]=${val[${i}]}  
     fi
      
done
#对比后的数数组长度为0就退出
if [ ${#new_val[*]} -eq 0 ] 
then
	echo "do not need update,exit"
	exit	
fi
for i in `seq 0 $((${#new_val[*]}-1))`
do        
      echo "$[i+1]:$currentV------------> ${new_val[${i}]}" 
done
#输入参数选择版本
while(true)
do
        echo "input number to choose "
	read tag
      		inputType=$tag
		teststr=${inputType#*[!1-${#new_val[*]}]}
		if [ "$inputType" != "$teststr" ]
			then
			echo "number can only contain 1 to ${#new_val[*]}."
			else
			break
		fi
done
#停止容器
echo "stop $service_name container "
ssh $user@$ip "docker stop $service_name"
checkFunctions
#删除容器
echo "delete $service_name container "
ssh $user@$ip "docker rm $service_name"
checkFunctions
#删除镜像
echo "delete $service_name images "
if [[ $service_name != *dsahkuhd*  ]]
       then
          ssh $user@$ip "docker rmi  $currentVersion"
       else
         imagesAll=$(ssh $user@$ip docker ps  --format "{{.Image}}")
         dsahkuhdImage="dsahkuhd:$currentV"
                 #echo "$imagesAll--------------------------------"
                 #echo "$dsahkuhdImage--------------------------------"
             if [[ $imagesAll != *$dsahkuhdImage*  ]]
               then
                ssh $user@$ip "docker rmi  $currentVersion"
               #echo "-------------------------------------"
       fi
fi
checkFunctions


#重新拉最新镜像并启动
initstart="docker run -d --net=host --log-opt max-size=1m --log-opt max-file=3 --restart=always"
initname="--name $service_name -itd $res_addr/$serviceName:${new_val[$tag-1]}"
echo "run docker in $ip"
if [[ $service_name == *mysql*  ]]
    then
        mysqlParam="-e MYSQL_ROOT_PASSWORD=123456 --ulimit nofile=65536:65536"
        echo "$initstart $loadaddr $mysqlParam $initname"
	ssh $user@$ip "$initstart $loadaddr $mysqlParam $initname"     
elif [[ $service_name == *redis*  ]]
    then	
        echo "$initstart $loadaddr $initname redis-server --appendonly yes"
	ssh $user@$ip "$initstart $loadaddr $initname redis-server --appendonly yes"
elif [[ $service_name == *rabbitmq*  ]]
    then	
        rabbitmqParam="-e RABBITMQ_DEFAULT_USER=admin -e RABBITMQ_DEFAULT_PASS=admin -e RABBITMQ_DEFAULT_VHOST=/vhost_jwzh"
        echo "$initstart $loadaddr $rabbitmqParam  $initname"
	ssh $user@$ip "$initstart $loadaddr $rabbitmqParam $initname"
elif [[ $service_name == *dsahkuhd*  ]]
    then	
        echo "$initstart $loadaddr --name=$service_name -itd $res_addr/dsahkuhd:${new_val[$tag-1]} $ip ${dsahkuhdName[1]}"
        ssh $user@$ip "$initstart $loadaddr --name=$service_name -itd $res_addr/dsahkuhd:${new_val[$tag-1]} $ip ${dsahkuhdName[1]}"
else     
        echo "$initstart $loadaddr $initname"
	ssh $user@$ip "$initstart $loadaddr $initname"
fi
checkFunctions 
echo "run docker done"
