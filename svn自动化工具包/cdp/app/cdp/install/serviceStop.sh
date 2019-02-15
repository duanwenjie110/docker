#! /bin/bash

#set -xv

curPwd=`pwd`
prj_dir_path=${curPwd}
hostCfg="host"
user="root"
stty erase ^H

getHostIpList()
{
	#获取所以主机Ip地址
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
		elif [ "$inputType" -ge "$index" ]
		then
			echo "number is greater than limit."
		else
			break
		fi
	done

		ret_chooseType=${!ANSWER};
}

	#获取所有主机ip地址
	getHostIpList


	#目标主机Ip地址
	chooseType $ret_hostIplist;
	targetHostIp="$ret_chooseType"
	echo "user choose hosts [ $targetHostIp]"

	if ping -c 3 $targetHostIp > /dev/null
	then
		echo "$targetHostIp ping success"
	else
		echo "$targetHostIp ping fail"
		exit -1
	fi

	#目标主机docker服务名称

showall(){
	# result=$(ssh $user@$targetHostIp docker ps --format '"'{{.Names}}: {{.Status}}'"'  )


	ssh $user@$targetHostIp "docker ps  -a --format '"'{{.Names}} {{.Status}}'"' " >${prj_dir_path}/temp/nameStopStatus.txt
}
	showall

getStartedDockerName()
{
	#获取所以主机Ip地址
	dockerNameList=`cat  ${prj_dir_path}/temp/nameStopStatus.txt|awk '{if($2~/^Up/) print $1'}`
	for dockername in $dockerNameList
	{

		if [[ -z "ret_$dockerNamelist" ]]
		then
			ret_dockernamelist="$dockername"
		else
			ret_dockernamelist="$ret_dockernamelist $dockername"
		fi
	}
	rm -rf ${prj_dir_path}/temp/nameStopStatus.txt
}
	getStartedDockerName


	if [[ -z $ret_dockernamelist ]]
	then
		echo "this docker all services stopped"
		exit -1
	else
		echo "this docker $ret_dockernamelist started"
	fi
		chooseType $ret_dockernamelist
		chooseName="$ret_chooseType"
		echo $chooseName


	ssh $user@$targetHostIp "docker stop $chooseName"
	re=$?
	if [ $re -eq 0 ]
	then
		echo "$chooseName stop success"
	else
		echo "$chooseName stop fail"
	fi
