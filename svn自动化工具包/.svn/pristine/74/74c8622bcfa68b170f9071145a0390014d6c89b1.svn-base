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
#存放最新war包的相对路径
war_path=$javaWar_path/war
#存放修改后war包的相对路径
war_modify_path=$javaWar_path/war_modify
ConfigInfoList="stream-loadbalance-jwzh/vod-loadbalance-jwzh socketio-jwzh/jwzh/background/view-jwzh javaCms/mq-jwzh serviceWar All Exit"
warpack=(background javaCms jwzh mq-jwzh socketio-jwzh stream-loadbalance-jwzh vod-loadbalance-jwzh view-jwzh)
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
if [  -e $prj_dir_path$war_path/$1 ]
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


#获取中心主机ip地址
centerHostIp=$(cat $prj_dir_path/centerhost|awk 'NR==1'|sed 's/\r//g')
#echo "center hostIp：$centerHostIp"

#获取所有主机ip地址
getHostIpList
while(true)
do
#目标主机Ip地址
echo "all hosts:"$w
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
echo "--------------------------------------------warning--------------------------------------------------"
echo "---------------if you don't choose 5,please use choose war in order  1,2,3----------------------"
echo "-------------no matter you want to install war packs on one host or more than one-------------------"
echo "all war packs:"
chooseType $ConfigInfoList;
targetwarname="$ret_chooseType"

echo "user choose warname [ $targetwarname ]"
username="root"
echo "[ $username ]" 

#授权
chmod a+x $prj_dir_path$javaWar_path/*.sh
#获取选择的war包名字
choose=$targetwarname

#关闭目标主机tomcat
ssh $username@$targetHostIp "docker stop tomcat"
checkFunctions

#获取所有war包名
files=$(ls $prj_dir_path/javaWar/war |grep '.war')
#去掉.war后缀
files=`echo $files |sed 's/.war//g'`
files=${files}" All"

#去掉主要war包，留下serviceWar包
for j in ${warpack[*]}
do
files=`echo $files |sed "s/$j//"`
done

if [ $choose == "serviceWar" ]
then
#删除目标主机下除了.war以外的文件
ssh $username@$targetHostIp "cd $tomcat_dir;shopt -s extglob;ls |egrep -v .war|xargs rm -rf"

echo "------------------------pleace choose which war to install----------------------"
chooseType $files;
secondChoose="$ret_chooseType"
	if [ $secondChoose == "solr" ] || [ $secondChoose == "All" ]
	then
		source $prj_dir_path$javaWar_path/ConfigExtract.sh $prj_dir_path $secondChoose 0
		#调用修改war包配置文件的脚本
		source $prj_dir_path$javaWar_path/ConfigModify.sh $prj_dir_path $secondChoose $targetHostIp
		#调用替换war包配置文件的脚本
		source $prj_dir_path$javaWar_path/ConfigReplace.sh $prj_dir_path $secondChoose
	fi
else
#删除目标主机下除了.war和server-map以外的文件
ssh $username@$targetHostIp "cd $tomcat_dir;shopt -s extglob;ls |egrep -v server-map|egrep -v .war|xargs rm -rf"
#调用提取war包配置文件的脚本
source $prj_dir_path$javaWar_path/ConfigExtract.sh $prj_dir_path $targetwarname 0
#调用修改war包配置文件的脚本
source $prj_dir_path$javaWar_path/ConfigModify.sh $prj_dir_path $targetwarname $targetHostIp
#调用替换war包配置文件的脚本
source $prj_dir_path$javaWar_path/ConfigReplace.sh $prj_dir_path $targetwarname
fi

#复制socketio-jwzh/jwzh/background到目标主机目录
copy1(){
	scp $prj_dir_path$war_modify_path/socketio-jwzh.war $1@$2:$3
	scp $prj_dir_path$war_modify_path/jwzh.war $1@$2:$3
	scp $prj_dir_path$war_modify_path/background.war $1@$2:$3
	scp $prj_dir_path$war_modify_path/view-jwzh.war $1@$2:$3
}

#复制javaCms/mq-jwzh到目标主机目录
copy2(){
	scp $prj_dir_path$war_modify_path/javaCms.war $1@$2:$3
	scp $prj_dir_path$war_modify_path/mq-jwzh.war $1@$2:$3
}

#复制stream-loadbalance-jwzh/vod-loadbalance-jwzh到目标主机目录
copy3(){
	scp $prj_dir_path$war_modify_path/stream-loadbalance-jwzh.war $1@$2:$3
	scp $prj_dir_path$war_modify_path/vod-loadbalance-jwzh.war $1@$2:$3
}

copy4(){
	scp $prj_dir_path$war_modify_path/$4.war $1@$2:$3
}

#判断选择
if [ $choose == "socketio-jwzh/jwzh/background/view-jwzh" ]
then
	copy1 $username $targetHostIp $tomcat_dir
	checkFunctions
	break
elif [ $choose == "javaCms/mq-jwzh" ]
then
	copy2 $username $targetHostIp $tomcat_dir
	checkFunctions
	break
elif [ $choose == "stream-loadbalance-jwzh/vod-loadbalance-jwzh" ]
then
	copy3 $username $targetHostIp $tomcat_dir
	checkFunctions
	break
elif [ $choose == "serviceWar" ]
then
	#检查war包是否存在
	if [ $secondChoose == "All" ]
	then
		files=`echo $files |sed "s/solr//"`
		checkWarExsit solr.war
		#复制war包
		copy4 $username $targetHostIp $tomcat_dir solr
		checkFunctions
		for filename in $files
			do
				if [ $filename != "All" ] 
				then
					checkWarExsit $filename.war
					#复制war包
					scp $prj_dir_path$war_path/$filename.war $username@$targetHostIp:$tomcat_dir
					checkFunctions
				fi
			done
	else
		if [ $secondChoose == "solr" ]
		then
			checkWarExsit $secondChoose.war
			#复制war包
			copy4 $username $targetHostIp $tomcat_dir $secondChoose
			checkFunctions
		else
			checkWarExsit $secondChoose.war
			#复制war包
			scp $prj_dir_path$war_path/$secondChoose.war $username@$targetHostIp:$tomcat_dir
			checkFunctions
		fi
	fi
	break
elif [ $choose == "Exit" ]
then
	break
elif [ $choose == "All" ]
then
   #复制serviceWar包
   		files=`echo $files |sed "s/solr//"`
		for filename in $files
			do
				if [ $filename != "All" ] 
				then
					checkWarExsit $filename.war
					#复制war包
					scp $prj_dir_path$war_path/$filename.war $username@$targetHostIp:$tomcat_dir
					checkFunctions
				fi
			done
	
    copy1 $username $targetHostIp $tomcat_dir
	checkFunctions
	copy2 $username $targetHostIp $tomcat_dir
    checkFunctions
	copy3 $username $targetHostIp $tomcat_dir
	checkFunctions
	copy4 $username $targetHostIp $tomcat_dir solr
	checkFunctions
	break
else
    echo "wrong choice"
fi
done

#开启动tomcat
ssh $username@$targetHostIp "docker start tomcat"
checkFunctions