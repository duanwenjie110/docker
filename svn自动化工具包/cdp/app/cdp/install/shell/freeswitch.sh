#! /bin/bash


parent_dir=`pwd`
config_arr=("/app/config.conf" "vars.xml")
#存放ccs config的远程路径
s_dir="$5ccs/config/"
#fs远程配置文件路径
remoteConfig_dir="$5/freeswitch/conf"
remoteSound_dir="$5/freeswitch/sounds"
#remoteDb_dir="$5/freeswitch/db"
#本地配置文件路径
local_dir="$parent_dir/data/conf/freeswitch/conf"
local_sound_dir="$parent_dir/data/conf/freeswitch/sounds"
temp_dir="$parent_dir/temp/freeswitch-temp/"
local_ccs_dir="$parent_dir/data/conf/ccs/config"
temp_ccs_dir="$parent_dir/temp/ccs-temp"
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

checkIpPortNetstat(){
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
fi
if [ ! -d $temp_ccs_dir ]; then
	mkdir -p -m 755 $temp_ccs_dir
	checkFunctions
fi
#拷贝配置文件
cp -arf $local_dir/* $temp_dir;
checkFunctions
cp -arf $local_ccs_dir/* $temp_ccs_dir;
checkFunctions
echo "configuration files has done"
#设置本地ip地址端口
while(true)
do
	echo "Edit ${config_arr[0]},enter local IP and port-------127.0.0.1:14000----------------:"
	read ccs_ip_port;
	checkIpPortNetstat $ccs_ip_port;
	if [ $? -eq 1 ]
	then
		break
	else
		continue
	fi
done
sed -i "s/"ccsIp:ccsPort"/$ccs_ip_port/g" $temp_ccs_dir${config_arr[0]}
fs_ip=`echo $ccs_ip_port|cut -d ':' -f1`
sed -i "s/"fsIp"/$fs_ip/g" $temp_dir${config_arr[1]}

echo $ip
ssh $user@$ip "if   test -e $remoteConfig_dir
then
echo "remote directory exists"
else
echo "remote directory  not exists,creating"
mkdir -p -m 777 $remoteConfig_dir
fi
if [ ! -d $remoteSound_dir ]; then
mkdir -p -m 755 $remoteSound_dir
echo "mkdir -p -m 755 ${remoteSound_dir} done"
else echo "${remoteSound_dir} exists"
fi
if [ ! -d $s_dir ]; then
mkdir -p -m 755 $s_dir
echo "mkdir -p -m 755 ${s_dir} done"
else echo "${s_dir} exists"
fi
"
echo "Coping config file"
scp -r $temp_dir/*  $user@$ip:$remoteConfig_dir
checkFunctions
scp -r $local_sound_dir/* $user@$ip:$remoteSound_dir
checkFunctions
scp -r $temp_ccs_dir/* $user@$ip:$s_dir
checkFunctions
echo "Cope config file done"
echo "Remove temple file"
rm -rf $temp_dir
checkFunctions
rm -rf $temp_ccs_dir
checkFunctions
echo "rm done"

#----------------------------------------------------------------------------



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
version=$(curl -s $res_addr/v2/freeswitch/tags/list)
if [[ $version != *errors*  ]]
	then
		echo "docker repository freeswitch's version list"
	else
		echo "docker repository freeswitchs version not found ,exit"
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
ssh $user@$ip "docker run -d --net=host --log-opt max-size=1m --log-opt max-file=3 --restart=always -v /etc/localtime:/etc/localtime:ro -v $remoteConfig_dir:/usr/local/freeswitch/conf  -v $remoteSound_dir:/usr/local/freeswitch/sounds -v $s_dir:/usr/local/ccs/config --name freeswitch -itd $res_addr/freeswitch:${arr[$tag-1]}"
