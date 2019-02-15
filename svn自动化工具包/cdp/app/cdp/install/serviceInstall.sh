#! /bin/bash

#set -xv
stty erase ^H
curPwd=`pwd`
prj_dir_path=${curPwd}
hostCfg="host"
serviceCfg="service"
#仓库端口
repository_port=`cat $prj_dir_path/centerhost|awk 'NR==2'|sed 's/\r//g'`
#挂载目录
remote_config_dir=`cat $prj_dir_path/centerhost|awk 'NR==3'|sed 's/\r//g'`

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

getServiceList()
{
	#get service info
	localServiceListname=$(curl -s http://$centerHostIp:$repository_port/v2/_catalog)
	echo "connect registry success..."
	localServiceListnamearr=`echo $localServiceListname|cut -d '[' -f2|cut -d ']' -f1|sed 's/\"//g'|sed "s/\,/ /g"`
	docker="docker"

	for servicename in $localServiceListnamearr
		{
			if [ -z "$ret_servicenamelist" ]
				then
					ret_servicenamelist="$docker $servicename"
				else
					ret_servicenamelist="$ret_servicenamelist $servicename"
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

#获取中心主机ip地址
centerHostIp=$(cat $prj_dir_path/centerhost|awk 'NR==1'|sed 's/\r//g')
#echo "center hostIp：$centerHostIp"

#获取所有主机ip地址
getHostIpList
#获取所有服务名称
getServiceList


#目标主机Ip地址
echo "all hosts:"
chooseType $ret_hostIplist;

targetHostIp=$ret_chooseType
echo "user choose hosts [$targetHostIp]"

if ping -c 3 $targetHostIp > /dev/null
then
	echo "$targetHostIp ping success"
else
	echo "$targetHostIp ping fail"
exit -1
fi

#目标主机服务名称
echo "all services:"
chooseType $ret_servicenamelist;
targetservername="$ret_chooseType"
echo "user choose servicename [ $targetservername ]"
username="root"
#java的服务版本不会变化，后期有变化再做修订
javaversion=$(cat version)

#saahkuhd可以安装多个，在脚本内部检查
if [[ $targetservername != "dsahkuhd" ]]  && [[ $targetservername != "docker" ]]
then
    serviceInfo=`ssh $username@$targetHostIp "docker ps -a | grep $targetservername:$javaversion"`
    if [[ ! -z "${serviceInfo}" ]]
    then
        echo "service ${targetservername} exist"
        exit
    fi
fi

#授权
chmod a+x $prj_dir_path/shell/*.sh
#调用服务的shell脚本
source $prj_dir_path/shell/$targetservername.sh $centerHostIp $targetHostIp $username $repository_port $remote_config_dir