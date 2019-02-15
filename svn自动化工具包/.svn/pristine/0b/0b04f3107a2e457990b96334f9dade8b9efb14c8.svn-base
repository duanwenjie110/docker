#! /bin/bash
parent_dir=`pwd`
config_dir="$parent_dir/data/conf/usg/"
config_arr=("/config/app/config.conf")
temp_dir="$parent_dir/temp/usg-temp/"
#存放config的远程路径
s_dir="$5/usg/"
#config要替换的通配符
wildcards="127.0.0.1"
#仓库地址
repository_addr="$1:$4"
service_name="usg"
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
					        return 1
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
echo "copy temple config file"
#如果没有temp_dir目录则创建
if [ ! -d $temp_dir ]; then
	sudo mkdir -p -m 755 $temp_dir
	checkFunctions
	echo "sudo mkdir -p -m 755 ${temp_dir} done"
fi

cp  -arf $config_dir/* $temp_dir;
checkFunctions
echo "copy done"


while(true)
do
	echo "Please input cms IP and port eg [ 127.0.0.1:40000 ] :"
	read cms_ip_port;
	checkIpPort $cms_ip_port
	if [ $? -eq 1 ]
	then
		break
	else
		continue
	fi
done
sed -i "s/"cmsIp:cmsPort"/$cms_ip_port/g" $temp_dir${config_arr[0]}
checkFunctions
while(true)
do
	echo "Please input  usg local IP and port eg [ 127.0.0.1:30000 ] :"
	read local_ip_port;
	checkIpPortNetstat $local_ip_port
	if [ $? -eq 1 ]
	then
		break
	else
		continue
	fi
done
sed -i "s/"localIp:localPort"/$local_ip_port/g" $temp_dir${config_arr[0]}
checkFunctions
while(true)
do
	echo "Please local sip IP and port eg [ 127.0.0.1:7060 ] :"
	read local_sip_ip_port;
	checkIpPortNetstat $local_sip_ip_port
	if [ $? -eq 1 ]
	then
		break
	else
		continue
	fi
done
sed -i "s/"localSipIP:localSipPort"/$local_sip_ip_port/g" $temp_dir${config_arr[0]}
checkFunctions
echo "Please input local sip code eg [ 34020000002000000001 ] :"
read local_sip_code;
sed -i "s/"localSipCode"/$local_sip_code/g" $temp_dir${config_arr[0]}
checkFunctions
while(true)
do
	echo "Please input remote sip IP and port eg [ 127.0.0.1:6060 ] :"
	read remote_sip_ip_port;
	checkIpPort $remote_sip_ip_port
	if [ $? -eq 1 ]
	then
		break
	else
		continue
	fi
done
sed -i "s/"remoteSipIp:remoteSipPort"/$remote_sip_ip_port/g" $temp_dir${config_arr[0]}
checkFunctions
echo "Please input  remote sip code eg [ 34020000002000000002 ] :"
read remote_sip_code;
sed -i "s/"remoteSipCode"/$remote_sip_code/g" $temp_dir${config_arr[0]}
checkFunctions
uuid=`cat /proc/sys/kernel/random/uuid`
sed -i "s/"localUuid"/$uuid/g" $temp_dir${config_arr[0]}
checkFunctions
echo "Edit done"

echo "Copy config file to $ip"
echo "Determine whether remote directory exists"
#read user;
ssh $user@$ip "if [ ! -d $s_dir ]; then
mkdir -p -m 755 $s_dir
echo "mkdir -p -m 755 ${s_dir} done"
	else echo "${s_dir} exists"
	fi
	#;if [ ! -d $images_dir ]; then
	#  mkdir -p -m 755 $images_dir
#  echo "mkdir -p -m 755 ${images_dir} done"
	#  else echo "${images_dir} 存在"
	#fi
	"
checkFunctions
echo "Coping config file"
scp -r $temp_dir/* $user@$ip:$s_dir
checkFunctions
echo "Cope config file done"

#echo "Coping image"
#scp -r $local_images_dir/$image_name $user@$ip:$images_dir
#echo "Cope image done"

echo "Remove temple file"
rm -rf $temp_dir
checkFunctions
echo "rm done"

#从远程仓库拉镜像
dockerResult=$(curl -s $repository_addr/v2/_catalog )
if  [[ $dockerResult ]]
	then
		echo "remote $repository_addr  docker repository usable"
	else
	echo "remote $repository_addr  docker repository confuse connect"
exit -1
fi

version=$(curl -s $repository_addr/v2/$service_name/tags/list)
if [[ $version != *errors*  ]]
	then
		echo "$service_name version list"
	else
	echo "version not found ,exit"
exit -1
fi

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

echo "run docker in $ip"

ssh $user@$ip "docker run --name=usg --net=host --log-opt max-size=1m --log-opt max-file=3 --restart=always -v /etc/localtime:/etc/localtime:ro -v $s_dir/config:/usr/local/usg/config -v $s_dir/db:/usr/local/usg/db -itd $repository_addr/$service_name:${arr[$tag-1]}"
checkFunctions
echo "run docker done"
