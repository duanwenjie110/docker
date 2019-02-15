#! /bin/bash
parent_dir=`pwd`
#远程配置文件路径
remoteConfig_dir="$5/umg/config"
#本地配置文件路径
local_dir="$parent_dir/data/conf/umg/config"
temp_dir="$parent_dir/temp/umg-temp"
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
ipCheck(){
	if echo $1 |egrep -q '^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$'
		then
			a=`echo $1 | awk -F. '{print $1}'`
			b=`echo $1 | awk -F. '{print $2}'`
			c=`echo $1 | awk -F. '{print $3}'`
			d=`echo $1 | awk -F. '{print $4}'`

			if [ $a -gt 255 ] || [ $a -lt 0 ]
				then
					echo "ip address is error"
					elif [ $b -gt 255 ] || [ $b -lt 0 ]
					then
						echo "ip address is error"
						elif [ $c -gt 255 ] || [ $c -lt 0 ]
						then
							echo "ip address is error"
							elif [ $d -gt 255 ] || [ $d -lt 0 ]
							then
								echo "ip address is error"
							else
							if ping -c 5 $1 > /dev/null
								then
									echo "ping success"
								return 1
							else
							echo "ping faild"
						return 0
					fi
				fi
			else
			echo 'ip address is error'
		return 0
	fi
}

checkPort(){
	   if echo $1 |egrep -q '^[0-9]{1,5}$'
	   then
		if [ $1 -gt 65535 ] || [ $1 -lt 1 ]
		then
			echo "error,input port between 1-65535"
			return 0
		else    
			return 1
		fi
	   else
	     echo "port input error"
	     return 0
	   fi

}

#拷贝配置文件
echo "Prepare configuration files"
#如果没有temp_dir目录则创建
if [ ! -d $temp_dir ]; then
	mkdir -p -m 755 $temp_dir
	checkFunctions
fi
cp  -arf $local_dir/* $temp_dir;
checkFunctions
while(true)
do      
	echo "Please input the usg Ip eg [ 127.0.0.1 ] :"
	read usgIp
        ipCheck $usgIp
	if [ $? -eq 1 ]
	then
	sed -i "s/usgIp/$usgIp/" $temp_dir/app/config.conf
	checkFunctions
	break
	else
        continue
	fi
	
done

while(true)
do      
	echo "Please input the usg Port eg [ 30000 ] :"
	read usgPort
        checkPort $usgPort
	if [ $? -eq 1 ]
	then
	sed -i "s/usgPort/$usgPort/" $temp_dir/app/config.conf
	checkFunctions
	break
	else
        continue
	fi
done

while(true)
do
	echo "Please input umg local Ip eg [ 127.0.0.1 ] :"
	read localIp
	ipCheck $localIp
	if [ $? -eq 1 ]
	then
	sed -i "s/localIp/$localIp/" $temp_dir/app/config.conf
	checkFunctions
	break
	else
        continue
	fi
done

while(true)
do
	echo "Please input umg local Port eg [ 53000 ] :"
	read localPort
	checkPort $localPort
	if [ $? -eq 1 ]
	then
	sed -i "s/localPort/$localPort/" $temp_dir/app/config.conf
	checkFunctions
	break
	else
        continue
	fi
done

localUuid=`cat /proc/sys/kernel/random/uuid`
sed -i "s/localUuid/$localUuid/" $temp_dir/app/config.conf
checkFunctions
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
scp -r $temp_dir/*  $user@$ip:$remoteConfig_dir
checkFunctions
rm -rf $temp_dir
checkFunctions
echo "send files success"




#从远程仓库啦镜像
dockerResult=$(curl -s $res_addr/v2/_catalog )
if  [[ $dockerResult ]]
	then
		echo "remote $res_addr  docker repository usable"
	else
	echo "remote $res_addr  docker repository confuse connect"
exit -1
fi

#远程仓库镜像版本显示
version=$(curl -s $res_addr/v2/umg/tags/list)
if [[ $version != *errors*  ]]
	then
		echo "docker repository umg's version list "
	else
	echo "docker repository umg's version not found ,exit"
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

#启动服务
ssh $user@$ip "docker run -d --net=host --log-opt max-size=1m --log-opt max-file=3 --restart=always -v /etc/localtime:/etc/localtime:ro -v $remoteConfig_dir:/usr/local/umg/config --name umg -itd $res_addr/umg:${arr[$tag-1]}"
#从远程仓库啦镜像





