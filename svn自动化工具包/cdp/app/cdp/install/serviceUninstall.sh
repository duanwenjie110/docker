#!/bin/bash

#ip=$2
#service_name=$1
stty erase ^H
curPwd=`pwd`
prj_dir_path=${curPwd}
hostCfg="host"
serviceCfg="service"
user="root"

#免密配置
pwdFreeLink(){
	echo "config password free login"
	ssh-keygen -t rsa
	ssh-copy-id -i ~/.ssh/id_rsa.pub $user@$ip
	echo "config password free login done"
}

getHostIpList()
{
	#获取所有主机Ip地址
	localHostListIp=`cat ${prj_dir_path}/${hostCfg}|awk '{print $1}'|sed 's/\r//g'`
	#get host info
	for hostIp in $localHostListIp
		{
			if [ -z "$ret_hostIplist" ]
				then
					ret_hostIplist="$hostIp"
				else
				ret_hostIplist="$ret_hostIplist $hostIp"
			fi
		}
	}

#检查服务运行
isDockerRunning(){
	result1=$(ssh $user@$ip service docker status | grep running)
	if [[ $result1 == *running*  ]]
	then
		echo "docke is running"
		return 1
	else
		echo "docker not running"
	return 0
	fi
}

isDockerInstalled(){
	result=$(ssh $user@$ip docker version | grep version)
	if [[ $result == *version*  ]]
		then
			echo "docker installed"
		return 1
	else
		echo "docker not installed"
	return 0
	fi
}

isServiceInstalled(){
	result=$(ssh $user@$ip docker ps -a | grep $1)
	if [[ $result == *$1*  ]]
	then
		echo "$1 installed"
		return 1
	else
		echo "$1 not installed"
	return 0
	fi
}

isServiceRunning(){
	result=$(ssh $user@$ip docker ps | grep $service_name)
	if [[ $result == *$service_name*  ]]
		then
			echo "$service_name is running"
		return 1
	else
		echo "$service_name not running"
	return 0
	fi
}

showdetail(){
	ssh $user@$ip "docker ps -a | grep $service_name" >./tmp.txt
	cat ./tmp.txt
	rm -rf ./tmp.txt
}

deleteService(){
	showdetail $service_name
	isServiceInstalled $service_name
	Ire=$?
	if [ $Ire -eq 1 ]
		then
			isServiceRunning $service_name
			re=$?
			if [ $re -eq 1 ]
				then
					ssh $user@$ip "docker stop $service_name"
				fi
				ssh $user@$ip "docker rm $service_name"
				re=$?
				elif [ $Ire -eq 0 ]
				then
				return 0
			fi
			if [ $re -eq 0 ]
				then
					echo "delete succeed"
				return 1
			else
			echo "delete failed"
		return 0
	fi
}
checkDocker(){
	isDockerInstalled
	if [ $? -eq 1 ]
		then
			isDockerRunning
			if [ $? -eq 1 ]
				then
				return 1
			else
			return 0
	fi
		return 0
	else
		return 0
	fi
}
showall(){
	ssh $user@$ip "docker ps -a" >./tmp.txt
	cat ./tmp.txt
}

ipcheck(){
        echo $1
	if echo $1 |egrep -q '^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$'
		then
			a=`echo $1 | awk -F. '{print $1}'`
			b=`echo $1 | awk -F. '{print $2}'`
			c=`echo $1 | awk -F. '{print $3}'`
			d=`echo $1 | awk -F. '{print $4}'`

			if [ $a -gt 255 ] || [ $a -lt 0 ]
				then
					echo "ip地址错误，不合法($a应在0-255中)"
					elif [ $b -gt 255 ] || [ $b -lt 0 ]
					then
						echo "ip地址错误，不合法($b应在0-255中)"
						elif [ $c -gt 255 ] || [ $c -lt 0 ]
						then
							echo "ip地址错误，不合法($c应在0-255中)"
							elif [ $d -gt 255 ] || [ $d -lt 0 ]
							then
								echo "ip地址错误，不合法($d应在0-255中)"
							else
							if ping -c 10 $1 > /dev/null
								then
									echo "ping通"
								return 1
							else
							echo "$1地址无法ping通"
						return 0
					fi
				fi
			else
			echo 'ip地址错误，不合法(xxx.xxx.xx.xxx)'
		return 0
	fi
}

runDelete(){
	while (true)
	do
		getServiceName
		chooseType $ret_Servicelist
		echo $ret_chooseType
		service_name=$ret_chooseType
		deleteService
		if [ $? -eq 0 ]
		then
			showall
			echo "please input the right service name"
			read service_name
			showdetail $service_name
			deleteService
			if [ $? -eq 1 ]
			then
				break
			fi
			elif [ $? -eq 1 ]
			then
				break
			fi
				echo "input Crtl+C exit"
			done
}

chooseType()
{
	index=1
	while (( "$index" <= $#))
	do
		echo "$index.${!index}"
		let "index++"
	done

	while :
	do
		printf "Please input your choice:"
		read ANSWER
		if [ "$ANSWER" = "" ]
		then
			ANSWER=1;
			break
		fi

		inputType=$ANSWER
		teststr=${inputType#*[!0-9]}
		if [ "$inputType" != "$teststr" ]
		then
			echo "number can only contain 0 to 9."
		elif [ "$inputType" -eq "0" ]
		then
			echo "number equals to 0, error."
		elif [ `echo $inputType | grep ^0` ]
		then
			echo "number error."
		elif [ "$inputType" -gt "$index" ]
		then
			echo "number is greater than limit."
		else
			break
			fi
	done

		ret_chooseType=${!ANSWER};
}

getServiceName()
{
	#获取所以主机Ip地址
	showall
	localHostListService=`cat ./tmp.txt | awk 'NR!=1{print $(NF)}'`
	#get host info
	for Ser in $localHostListService
	{
		if [ -z "$ret_Servicelist" ]
		then
			ret_Servicelist="$Ser"
		else
			ret_Servicelist="$ret_Servicelist $Ser"
		fi
		rm -rf ./tmp.txt
	}
}


	getHostIpList

	#目标主机Ip地址

	chooseType $ret_hostIplist;
	targetHostIp="$ret_chooseType"
	ip=$targetHostIp
	echo "user choose hosts [ $targetHostIp]"
		#pwdFreeLink
		checkDocker
		if [ $? -eq 1 ]
		then
		runDelete
		fi

