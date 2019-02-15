#! /bin/bash

parent_dir=`pwd`
#远程配置文件路径
remoteConfig_dir="$5/mss"
#本地配置文件路径
local_dir="$parent_dir/data/conf/mss"
temp_dir="$parent_dir/temp/mss-temp"
name="mss"
#中心主机仓库ip端口
res_addr="$1:$4"
#目标主机ip,用户名
ip=$2
user=$3
stty erase ^H
checkFunctions(){
if [ $? -ne 0 ] 
then
	echo "comond execute fail"
	exit	
fi
}
checkIpPort(){
if echo $1 |egrep -q '^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\:[0-9]{1,5}$'
then    
    localIpCheck=`echo $1 | awk -F: '{print $1}'`
    a=`echo $localIpCheck | awk -F. '{print $1}'`
    b=`echo $localIpCheck | awk -F. '{print $2}'`
    c=`echo $localIpCheck | awk -F. '{print $3}'`
    d=`echo $localIpCheck | awk -F. '{print $4}'`

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
        if ping -c 3 $localIpCheck > /dev/null
        then
            echo "$localIpCheck ping success"
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

checkNum(){
	if echo $1 |egrep -q '^[1-9][0-9]*$'
	then
		return 1
	else
	echo "enter number error"
	return 0
	fi
}

echo "Please input the store volume dir eg [ /home/flv/ ] :"
read volumedir
if ssh $user@$ip test -e $volumedir;
    then echo "remote directory $volumedir exists"
    else echo "remote directory $volumedir not exists ,please ceate"
    exit
fi
if ssh $user@$ip test -e $volumedir/tmp;
    then echo "remote directory $volumedir/tmp exists"
    else echo "remote directory $volumedir/tmp not exists ,please ceate"
    exit
fi

if ssh $user@$ip test -e $volumedir/state;
    then echo "remote directory $volumedir/state exists"
    else echo "remote directory $volumedir/state not exists ,please ceate"
    exit
fi

if ssh $user@$ip test -e $volumedir/work;
    then echo "remote directory $volumedir/work exists"
    else echo "remote directory $volumedir/work not exists ,please ceate"
    exit
fi

ssh $user@$ip "chmod 777 $volumedir/*"
checkFunctions
#echo "--------------------------"
#echo $?
#echo "--------------------------"
#拷贝配置文件
echo "create temp dir"
#如果没有temp_dir目录则创建
if [ ! -d $temp_dir ]; then
	sudo mkdir -p -m 755 $temp_dir
	checkFunctions
	echo "${temp_dir} create done"
fi


cat /dev/null >>$temp_dir$"/mss.docker"
echo $volumedir >>$temp_dir$"/mss.docker"
checkFunctions
cp -arf $local_dir/* $temp_dir;
checkFunctions
echo "files copy to temp dir done"


while(true)
do      
	echo "Please input mss local Ip eg [ 127.0.0.1 ] :"
	read localIpAddr
	ipCheck $localIpAddr
	if [ $? -eq 1 ]
	then
		sed -i "s/localIpAddr/$localIpAddr/" $temp_dir/conf/extra/server_play.conf
		checkFunctions
		sed -i "s/localIpAddr/$localIpAddr/" $temp_dir/conf/extra/server_status.conf
		checkFunctions
		sed -i "s/localIpAddr/$localIpAddr/" $temp_dir/conf/extra/server_upload.conf
		checkFunctions
		sed -i "s/localIpAddr/$localIpAddr/" $temp_dir/html/php/config.php
		checkFunctions  
		break
	else
		continue
	fi
done

while(true)
do      
	echo "Please input mss local Port eg [ 21000 ] :"
	read localPort
	checkPort $localPort
	if [ $? -eq 1 ]
	then
	    localPort2=`expr $localPort + 1`;
		localPort3=`expr $localPort + 2`;
		sed -i "s/localPort2/$localPort2/" $temp_dir/conf/extra/server_play.conf
		sed -i "s/localPort2/$localPort2/" $temp_dir/html/php/config.php
		checkFunctions
		sed -i "s/localPort3/$localPort3/" $temp_dir/conf/extra/server_status.conf
		checkFunctions
		sed -i "s/localPort1/$localPort/" $temp_dir/conf/extra/server_upload.conf
		sed -i "s/localPort1/$localPort/" $temp_dir/html/php/config.php
		checkFunctions

		break
	else
		continue
	fi
done

while(true)
do      
	echo "Please input the tomcat Ip and Port eg [ 127.0.0.1:8080 ] :"
	read tomcatIpPort
	checkIpPort $tomcatIpPort
	if [ $? -eq 1 ]
	then
		sed -i "s/tomcatIpPort/$tomcatIpPort/" $temp_dir/conf/extra/server_status.conf
		checkFunctions
		break
	else
		continue
	fi
done

while(true)
do      
	echo "Please input the mysql Ip eg [ 127.0.0.1 ] :"
	read mysqlIp
	ipCheck $mysqlIp
	if [ $? -eq 1 ]
	then
		sed -i "s/mysqlIp/$mysqlIp/" $temp_dir/html/php/config.php
		checkFunctions
		break
	else
		continue
	fi
done

while(true)
do      
	echo "Please input mss storeSpace size(G) eg [ 5 ] :"
	read storeSpace
	checkNum $storeSpace
	if [ $? -eq 1 ]
	then
		sed -i "s/storeSpace/$storeSpace/" $temp_dir/html/php/config.php
		checkFunctions
		break
	else
		continue
	fi
done


#远程连接后新建目录
ret=`ssh $user@$ip "if [ ! -d $remoteConfig_dir ]; then
mkdir -p -m 755 $remoteConfig_dir
if [ $? -ne 0 ]; then
echo "fail"
exit
fi
echo "remote directory  not exists,creating"
else echo "remote directory exists"
fi"`

echo $ret
if [ "$ret" == "fail" ]
then
    exit
fi

#拷贝config文件#
scp -r $temp_dir/* $user@$ip:$remoteConfig_dir
checkFunctions
echo "send files success"
rm -rf $temp_dir
checkFunctions

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
version=$(curl -s $res_addr/v2/$name/tags/list)
if [[ $version != *errors*  ]]
	then
		echo "docker repository $name's version list"
	else
	echo "docker repository $name's version not found ,exit"
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
echo " run docker"
ssh $user@$ip "docker run -d --net=host --log-opt max-size=1m --log-opt max-file=3 --restart=always -v /etc/localtime:/etc/localtime:ro -v $volumedir:/home/store -v $remoteConfig_dir/conf:/usr/local/nginx-$name/conf -v $remoteConfig_dir/html:/usr/local/nginx-$name/html --name $name -itd $res_addr/$name:${arr[$tag-1]}"
echo "docker started"
