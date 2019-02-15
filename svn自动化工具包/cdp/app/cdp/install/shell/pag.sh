#! /bin/bash
parent_dir=`pwd`
config_dir="$parent_dir/data/conf/pag/"
temp_dir="$parent_dir/temp/pag-temp/"
#存放config的远程路径
s_dir="$5/pag/"
#config要替换的通配符
wildcards="127.0.0.1"
#仓库地址
repository_addr="$1:$4"

service_name="pag"
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



checkPortNetstat(){
   if echo $1 |egrep -q '^[0-9]{1,5}$'
   then
	if [ $1 -gt 65535 ] || [ $1 -lt 1 ]
	then
		echo "error,input port between 1-65535"
		return 0
	else
		result=$(ssh $user@$ip netstat -an | grep LISTEN | grep -w $1)
		if [[ $result != *$1*  ]]
			then
				echo "usable"
				return 1
			else
				echo "unusable"
				return 0
		fi
	fi
   else
     echo "port input error"
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
#echo $?
echo "copy done"

while(true)
do      
	echo "Please input the cms Ip eg [ 127.0.0.1 ] :"
	read cmsIp
	ipCheck $cmsIp
	if [ $? -eq 1 ]
	then
		sed -i "s/cmsIp/$cmsIp/" $temp_dir/config/app/config.conf
		checkFunctions
		break
	else
		continue
	fi
done

while(true)
do      
	echo "Please input the cms Port eg [ 40000 ] :"
	read cmsPort
	checkPort $cmsPort
	if [ $? -eq 1 ]
	then
		sed -i "s/cmsPort/$cmsPort/" $temp_dir/config/app/config.conf
		checkFunctions
		break
	else
		continue
	fi
done

while(true)
do      
	echo "Please input the pag local Ip eg [ 127.0.0.1 ] :"
	read localIp
	ipCheck $localIp
	if [ $? -eq 1 ]
	then
		sed -i "s/localIp/$localIp/" $temp_dir/config/app/config.conf
		checkFunctions
		break
	else
		continue
	fi
done

while(true)
do      
	echo "Please input the pag local Port eg [ 40011 ] :"
	read localPort
	checkPortNetstat $localPort
	if [ $? -eq 1 ]
	then
		sed -i "s/localPort/$localPort/" $temp_dir/config/app/config.conf
		checkFunctions
		break
	else
		continue
	fi
done

while(true)
do      
	echo "Please input the pag local Sip Ip eg [ 127.0.0.1 ] :"
	read localSipIp
	ipCheck $localSipIp
	if [ $? -eq 1 ]
	then
		sed -i "s/localSipIp/$localSipIp/" $temp_dir/config/app/config.conf
		checkFunctions
		break
	else
		continue
	fi
done

while(true)
do      
	echo "Please input the pag local Sip Port eg [ 8060 ] :"
	read localSipPort
	checkPortNetstat $localSipPort
	if [ $? -eq 1 ]
	then
		sed -i "s/localSipPort/$localSipPort/" $temp_dir/config/app/config.conf
		checkFunctions
		break
	else
		continue
	fi
done
echo "Please input the pag local Sip Code eg [ 34020000002000000001 ] :" 
read localSipCode
sed -i "s/localSipCode/$localSipCode/" $temp_dir/config/app/config.conf
checkFunctions

localUuid=`cat /proc/sys/kernel/random/uuid`
sed -i "s/localUuid/$localUuid/" $temp_dir/config/app/config.conf
checkFunctions

echo "Copy config file to $ip "
echo "Determine whether remote directory exists"

ssh $user@$ip "if [ ! -d $s_dir ]; then
mkdir -p -m 755 $s_dir
echo "mkdir -p -m 755 ${s_dir} done"
else echo "${s_dir} exists"
fi
#;if [ ! -d $images_dir ]; then
#  mkdir -p -m 755 $images_dir
#  echo "mkdir -p -m 755 ${images_dir} done"
#  else echo "${images_dir} exist"
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

ssh $user@$ip "docker run --name=pag --net=host --log-opt max-size=1m --log-opt max-file=3 --restart=always -v /etc/localtime:/etc/localtime:ro -v $s_dir/config:/usr/local/pag/config -v $s_dir/db:/usr/local/pag/db -itd $repository_addr/$service_name:${arr[$tag-1]}"
echo "docker started"
