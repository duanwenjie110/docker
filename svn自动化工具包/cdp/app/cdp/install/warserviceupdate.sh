#! /bin/bash

#set -xv
stty erase ^H
curPwd=`pwd`
prj_dir_path=${curPwd}
hostCfg="host"
serviceCfg="service"
#仓库端口
repository_port=`cat $prj_dir_path/centerhost |awk 'NR==2'|sed 's/\r//g'`
#挂载目录
tomcat_dir=`cat $prj_dir_path/centerhost |awk 'NR==3'|sed 's/\r//g'`"tomcat/webapps"
#瓦片临时目录
tiles_temp_dir=`cat $prj_dir_path/centerhost |awk 'NR==3'|sed 's/\r//g'`"tiles_temp/"
cfg_path=javaWar/config
#存放javaWar包及其子脚本的相对路径
javaWar_path=/javaWar
#存放目标主机备份war包的相对路径
warBackup_path=$javaWar_path/war_Backup
warModify_path=$javaWar_path/war_modify
ConfigInfoList="stream-loadbalance-jwzh/vod-loadbalance-jwzh socketio-jwzh/jwzh/background javaCms/mq-jwzh server-map All Exit"
warpack=(background javaCms jwzh mq-jwzh socketio-jwzh stream-loadbalance-jwzh vod-loadbalance-jwzh view-jwzh solr)
#检查命令是否正确执行
checkFunctions (){
if [ $? -ne 0 ] 
then
	echo "comand execute fail"
	exit	
fi
}

#检查war包是否存在
checkWarExsit (){
if [  -e $prj_dir_path$javaWar_path/war/$1 ]
then
echo " "
else
echo "$1 not exist, please check"
exit	
fi
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

	#将数组的元素生成选择表
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

isInFile(){
	temp=`echo $1 |sed 's/.war//g'`
	for j in ${warpack[*]}
	do
		if [ $j == $temp ]
		then
			return 1
		fi
	done
	return 0
}


#获取中心主机ip地址
centerHostIp=$(cat $prj_dir_path/centerhost|awk 'NR==1'|sed 's/\r//g')
#echo "center hostIp：$centerHostIp"

#获取所有主机ip地址
getHostIpList
while(true)
do
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

username="root"
echo "[ $username ]" 
#result1=$(ssh $user@$ip service docker status | grep running)
files=$(ssh $username@$targetHostIp "ls $tomcat_dir |grep '.war' ") 
serviceFiles=$files
files=${files}" All"
chooseType $files
targetFile=$ret_chooseType

#获取所有war包名
#去掉.war后缀
#serviceFiles=`echo $serviceFiles |sed 's/.war//g'`
#去掉主要war包，留下serviceWar包
for j in ${warpack[*]}
do
serviceFiles=`echo $serviceFiles |sed "s/$j//"`
done

#删除目标主机下除了.war和server-map以外的文件
ssh $username@$targetHostIp "cd $tomcat_dir;shopt -s extglob;ls |egrep -v server-map|egrep -v .war|xargs rm -rf"

#将目标主机war包备份到本机上，参数是 用户名、ip、目标文件夹、文件名称
copy(){
	if [ -e $prj_dir_path$warBackup_path ]
	then
	echo "warBackup exist"
	else
	mkdir -p $prj_dir_path$warBackup_path
	fi
	scp $2@$3:$4/$1 $prj_dir_path$warBackup_path
}

#将修改好的war包发送到目标主机，参数是 用户名、ip、目标文件夹、文件名称
copyBack(){
	scp $prj_dir_path$warModify_path/$1 $2@$3:$4
}

#关闭目标主机tomcat
ssh $username@$targetHostIp "docker stop tomcat"
checkFunctions

isInFile $targetFile
isInResult=$?

if [ $targetFile == "All" ]
then
#备份所有
copy *.war $username $targetHostIp $tomcat_dir
checkFunctions
#server-map.war不需要修改，直接将新的server-map.war放到替换文件夹中
	for f in $serviceFiles
	do
		#server-map.war不需要修改，直接将新的server-map.war放到替换文件夹中
		mkdir -p $prj_dir_path$warModify_path
		\cp -arf $prj_dir_path$javaWar_path/war/$f $prj_dir_path$warModify_path
		checkFunctions
	done
#提取配置文件
		for filename in $files
			do
				if [ $filename != "All" ] 
				then
					source $prj_dir_path$javaWar_path/ConfigExtract.sh $prj_dir_path $filename 1
					checkFunctions
				fi
			done
else
#备份
#server-map.war没有配置文件，直接备份
	if [ -n "$serviceFiles" ]
	then
		for f in $serviceFiles
		do
			if [ $f == $targetFile ]
			then
				copy $f $username $targetHostIp $tomcat_dir
				checkFunctions
				#server-map.war不需要修改，直接将新的server-map.war放到替换文件夹中
				mkdir -p $prj_dir_path$warModify_path
				\cp -arf $prj_dir_path$javaWar_path/war/$f $prj_dir_path$warModify_path
				checkFunctions
			fi
		done
	fi

	if [ $isInResult == 1 ]
	then
		copy $targetFile $username $targetHostIp $tomcat_dir
		checkFunctions
		#提取配置文件
		source $prj_dir_path$javaWar_path/ConfigExtract.sh $prj_dir_path $targetFile 1
		checkFunctions
	fi
fi


if [ $targetFile == "All" ]
then
		for filename in $files
			do
				if [ $filename != "All" ] 
				then
				#调用替换脚本，替换备份好的配置文件
				source $prj_dir_path$javaWar_path/ConfigReplace.sh $prj_dir_path $filename
				checkFunctions
				#将改好的文件发送打目标主机
				copyBack $filename $username $targetHostIp $tomcat_dir
				checkFunctions
				fi
			done
else
	if [ -n "$serviceFiles" ]
	then
	#server-map.war没有配置文件，不需要替换，直接发送到目标主机
		for f in $serviceFiles
		do
			if [ $f == $targetFile ]
			then
				copyBack $f $username $targetHostIp $tomcat_dir
				checkFunctions
			fi
		done
	fi
	if [ $isInResult == 1 ]
	then
	#调用替换脚本，替换备份好的配置文件
	source $prj_dir_path$javaWar_path/ConfigReplace.sh $prj_dir_path $targetFile
	checkFunctions
	#将改好的文件发送打目标主机
	copyBack $targetFile $username $targetHostIp $tomcat_dir
	checkFunctions
	fi
fi

#开启动tomcat
ssh $username@$targetHostIp "docker start tomcat"
checkFunctions
exit

#判断选择
done

