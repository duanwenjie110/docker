#! /bin/bash

parent_dir=`pwd`
#远程配置文件路径
remoteConfig_dir="$5/cms/config"
#本地配置文件路径
local_dir="$parent_dir/data/conf/cms/config"
temp_dir="$parent_dir/temp/cms-temp"
#中心主机仓库ip端口
res_addr="$1:$4"
#目标主机ip,用户名
ip=$2
user=$3
stty erase ^H
checkFunctions (){
if [ $? -ne 0 ] 
then
	echo "comond execute fail"
	exit	
fi
}
checkIpPort(){
	if echo $1 |egrep -q '^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\:[0-9]{1,5}$'
	then    
		        ipCheck=`echo $1 | awk -F: '{print $1}'`
			a=`echo $ipCheck | awk -F. '{print $1}'`
			b=`echo $ipCheck | awk -F. '{print $2}'`
			c=`echo $ipCheck | awk -F. '{print $3}'`
			d=`echo $ipCheck | awk -F. '{print $4}'`

			if [ $a -gt 255 ] || [ $a -lt 0 ]
			then
				echo "ip address error ($a must between 0-255)"
				return 0
			elif [ $b -gt 255 ] || [ $b -lt 0 ]
			then
				echo "ip address error ($b must between 0-255)"
				return 0
			elif [ $c -gt 255 ] || [ $c -lt 0 ]
			then
				echo "ip address error ($c must between 0-255)"
				return 0
			elif [ $d -gt 255 ] || [ $d -lt 0 ]
			then
				echo "ip address error ($d must between 0-255)"
				return 0
			else
				if ping -c 3 $ipCheck > /dev/null
				then
					echo "$ipCheck ping success"
					portCheck=`echo $1 | awk -F: '{print $2}'`
					if [ $portCheck -gt 65535 ] || [ $portCheck -lt 1 ]
					then
						echo "error,input port between 1-65535"
					        return 0
					else    
					     	result=$(ssh $user@$ip netstat -an | grep LISTEN | grep -w $portCheck)
						if [[ $result != *$portCheck*  ]]
							then
								echo "port $portCheck usable"
								return 1
							else
								echo "port $portCheck has been used"
								return 0
						fi
					       
					fi
				else
					echo "$1 ping fail"
					return 0
				fi
			fi
	else
			echo "ip:port error (must like this ->xxx.xxx.xxx.xxx:xxxx)"
			return 0
	fi
	 
}

echo "Prepare configuration files"
#如果没有temp_dir目录则创建
if [ ! -d $temp_dir ]; then
	mkdir -p -m 755 $temp_dir
	checkFunctions
	# echo "sudo mkdir -p -m 755 ${temp_dir} done"
fi
cp  -arf /$local_dir/* $temp_dir;
checkFunctions


while(true)
do
	echo "Please Input cms local Ip and Port  for CPP server eg [ 127.0.0.1:40000 ] :"
	read ipPort1
	checkIpPort $ipPort1
	if [ $? -eq 1 ]
	then
	sed -i "s/localIpPort1/$ipPort1/" $temp_dir/app/config.conf
	checkFunctions
	break
	else
        continue
	fi

done

while(true)
do
	echo "Please Input cms local Ip and Port  for javaCms eg [127.0.0.1:40001 ] :"
	read ipPort2
	checkIpPort $ipPort2
	if [ $? -eq 1 ]
	then
	sed -i "s/localIpPort2/$ipPort2/" $temp_dir/app/config.conf
	checkFunctions
	break
	else
        continue
	fi

done

echo "configuration files has done"
echo $ip
ssh $user@$ip "if   test -e $remoteConfig_dir
then
echo "remote directory exists"
else
echo "remote directory  not exists,creating"
mkdir -p -m 777 $remoteConfig_dir
fi"
checkFunctions

#                     if [ ! -d $images_dir ]
#                     then
#                       mkdir -p -m 777 $images_dir
#                       echo "远程镜像目录不存在,创建目录"
#                     else
#                       echo "远程镜像目录存在,拷贝镜像文件"
#                     fi"
scp -r $temp_dir/*  $user@$ip:$remoteConfig_dir
checkFunctions
rm -rf $temp_dir
checkFunctions
echo "send files success"

#   echo "准备发送镜像"
#           scp -r $local_images_dir/$image_name $user@$ip:$images_dir
#    echo "cms镜像发送完毕"
#----------------------------------------------------------------------------
#    break
# else
#   echo "请填入正确的数字"
#   continue
# fi
# done

#如果需要开启远程端口,则启用
#while(true)
#do
#	 echo "请输入工程开启的端口,测试用,不需要可屏蔽"
#read port
#result=$(ssh $user@$ip netstat -an | grep LISTEN | grep -w $port)
#echo $result
#if [[ $result != *$port*  ]]
#then
# echo "可用"
#break
#else
# echo "不可用"
#fi
#done
#如果需要开启远程端口,则启用

#直接load目录的镜像
#echo "执行docker相关 $ip"
#ssh $user@$ip "docker load --input $images_dir/$image_name;docker run --name=cms --net=host --restart=always -v /etc/localtime:/etc/localtime:ro -v $remoteConfig_dir:/usr/local/cms/config -itd cms:V1.0.0H1.0.0"
#echo "docker执行完毕"
#直接load目录的镜像

#从远程仓库啦镜像
dockerResult=$(curl -s $res_addr/v2/_catalog )
if  [[ $dockerResult ]]
	then
		echo "remote $res_addr  docker repository usable"
	else
		echo "remote $res_addr  docker repository confuse connect"
exit -1
fi
# res=`echo $dockerResult|cut -d '[' -f2|cut -d ']' -f1`
# echo "请选择镜像名称"
# echo $res | awk  'BEGIN{RS=","}{print $1}'
# read image

#远程仓库镜像版本显示
version=$(curl -s $res_addr/v2/cms/tags/list)
if [[ $version != *errors*  ]]
	then
		echo "docker repository  cms's version list "
	else
		echo "docker repository  cms's version not found ,exit"
exit -1
fi

#选择远程仓库镜像数组
# echo `pwd`
version_arr=`echo $version|cut -d '[' -f2|cut -d ']' -f1`
echo $version_arr | awk  'BEGIN{RS=","}{print FNR":" $1}'
while(true)
do
	echo "input number to choose images"
	read tag
	IFS=","
	arr=($version_arr)
	if echo $tag |egrep -q "^[1-"${#arr[@]}"]{1}$"
		then
			echo "you choose the version is ${arr[$tag-1]}"
			break
		else
		echo "error,input numbers between 1-${#arr[@]}"
	fi
done
cmsip=`echo $ipPort2 | awk -F: '{print $1}'`
cmsport=`echo $ipPort2  | awk -F: '{print $2}'`
sed -i '/cms/d' warConfigInfo.ini
echo "cms: ip=$cmsip port=$cmsport" >>warConfigInfo.ini
#启动服务
ssh $user@$ip "docker run -d --net=host --log-opt max-size=1m --log-opt max-file=3 --restart=always -v /etc/localtime:/etc/localtime:ro -v $remoteConfig_dir:/usr/local/cms/config  --name cms -itd $res_addr/cms:${arr[$tag-1]}"






