#! /bin/bash

#set -xv

curPwd=`pwd`
prj_dir_path=${curPwd}
hostCfg="host"
serviceCfg="service"
username="root"



getCenterHostIp()
{
	while(true)
	do
		echo  "please input center host centerHostIp address:"
		read centerHostIp;
		stty erase ^H
		if echo $centerHostIp |egrep -q '^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$'
			then
				a=`echo $centerHostIp | awk -F. '{print $1}'`
				b=`echo $centerHostIp | awk -F. '{print $2}'`
				c=`echo $centerHostIp | awk -F. '{print $3}'`
				d=`echo $centerHostIp | awk -F. '{print $4}'`

				if [ $a -gt 255 ] || [ $a -lt 0 ]
					then
						echo "centerHostIp address is error"
						elif [ $b -gt 255 ] || [ $b -lt 0 ]
						then
							echo "centerHostIp address is error"
							elif [ $c -gt 255 ] || [ $c -lt 0 ]
							then
								echo "centerHostIp address is error"
								elif [ $d -gt 255 ] || [ $d -lt 0 ]
								then
									echo "centerHostIp address is error"
								else
								if ping -c 10 $centerHostIp > /dev/null
									then
										echo "ping centerHostIp success"
										break
									else
									echo "$centerHostIp ping is faild"
								fi
							fi
						else
						echo 'centerHostIp address is error'
						continue
					fi

				done
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

#获取中心主机ip地址
#getCenterHostIp
#echo "center hostIp：$centerHostIp"


#获取所有主机ip地址
getHostIpList
#获取所有服务名称
#getServiceList

#目标主机Ip地址
chooseType $ret_hostIplist;
targetHostIp="$ret_chooseType"
echo "user choose hosts [ $targetHostIp]"

if ping -c 5 $targetHostIp > /dev/null
	then
		echo "$targetHostIp ping  success"
	else
	echo "$targetHostIp ping  fail"
exit -1
fi

#检查服务运行
isDockerRunning(){
	result1=$(ssh $username@$targetHostIp "service docker status | grep running")
	if [[ $result1 == *running*  ]]
		then
		return 1
	else
return 0
fi
}

isDockerRunning
if [ $? -eq 1 ]
	then
		echo "show $targetHostIp docker service staus："
		ssh $username@$targetHostIp "docker ps -a "
	else
	echo "$targetHostIp上docker stopped"
fi

