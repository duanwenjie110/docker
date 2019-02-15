#!/bin/bash
stty erase ^H
curPwd=`pwd`
prj_dir_path=${curPwd}
hostCfg="host"
user="root"

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

	#检查服务运?
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
	if echo $ip |egrep -q '^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$'
		then
			a=`echo $ip | awk -F. '{print $1}'`
			b=`echo $ip | awk -F. '{print $2}'`
			c=`echo $ip | awk -F. '{print $3}'`
			d=`echo $ip | awk -F. '{print $4}'`

			if [ $a -gt 255 ] || [ $a -lt 0 ]
				then
				echo "ip addrss is error"
			elif [ $b -gt 255 ] || [ $b -lt 0 ]
				then
				echo "ip addrss is error"
			elif [ $c -gt 255 ] || [ $c -lt 0 ]
				then
				echo "ip addrss is error"
			elif [ $d -gt 255 ] || [ $d -lt 0 ]
				then
				echo "ip addrss is error"
			else
				if ping -c 10 $ip > /dev/null
					then
					echo "ping success"
					return 1
				else
					echo "$ip ping fail"
					return 0
				fi
			fi
		else
			echo 'ip addrss is error'
		return 0
	fi
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
				echo "input number"
			elif [ "$inputType" -eq "0" ]
			then
				echo "number equals to 0, error."
			elif [ `echo $inputType | grep ^0` ]
			then
				echo "number error."
			elif [ "$inputType" -ge "$index" ]
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
  		rm -rf ./tmp.txt
		#get host info
		for Ser in $localHostListService
		{
			if [ -z "$ret_Servicelist" ]
			then
			ret_Servicelist="$Ser"
			else
			ret_Servicelist="$ret_Servicelist $Ser"
			fi		
		}
                 if [ -z "$ret_Servicelist" ]
                 then
                        echo "there is no choice  exit"
                        exit
                 fi
            
}



	getHostIpList
	#目标主机Ip地址
	chooseType $ret_hostIplist;
	targetHostIp="$ret_chooseType"
	ip=$targetHostIp
	echo "user choose hosts [ $targetHostIp]"

	ipcheck
	ipc=$?
	if [ $ipc -eq 1 ]
	then
	#pwdFreeLink
	checkDocker
		if [ $? -eq 1 ]
		then
		getServiceName
		chooseType $ret_Servicelist
		echo $ret_chooseType
		service_name=$ret_chooseType
              # sed -i 's/\r$//' centerhost
		centerHostIp=`cat $prj_dir_path/centerhost|awk 'NR==1'|sed 's/\r//g'`
		#仓库端口
		repositoryPort=`cat $prj_dir_path/centerhost|awk 'NR==2'|sed 's/\r//g'`
		source $prj_dir_path/shell/update.sh $centerHostIp $ip $user $repositoryPort $service_name
		fi
	fi
