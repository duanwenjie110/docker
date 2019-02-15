#! /bin/bash
parent_dir=`pwd`
#远程tomcat路径
tomcat_dir="$5/tomcat/"
#本地tomcat路径
local_tomcat_dir="$parent_dir/data/conf/tomcat/"
temp_dir="$parent_dir/temp/tomcat-temp/"
#仓库地址
repository_addr="$1:$4"
ip=$2
user=$3
#replace.sh目录
#replace_dir=$parent_dir/javaWar/modifyWarCfg.sh
service_name="tomcat"

checkFunctions (){
if [ $? -ne 0 ] 
then
	echo "comond execute fail"
	exit	
fi
}
stty erase ^H
echo "validate default port:8080"
port=8080
result=$(ssh $user@$ip netstat -an | grep LISTEN | grep -w $port)
#echo $result
if [[ $result != *$port*  ]]
	then
		echo "$port usable"
	else
	echo "$port unusable"
exit -1
fi
echo "copy temple config file"
#如果没有temp_dir目录则创建
if [ ! -d $temp_dir ]; then
	sudo mkdir -p -m 755 $temp_dir
	checkFunctions
	echo "sudo mkdir -p -m 755 ${temp_dir} done"
fi

cp  -arf $local_tomcat_dir/* $temp_dir;
checkFunctions
echo "copy done"

if [ ! -d $temp_dir/webapps ]; then
	mkdir -p -m 755 $temp_dir/webapps
	checkFunctions
	echo "mkdir -p -m 755 ${$temp_dir/webapps} done"
fi

#chmod 777 $replace_dir
#source $replace_dir $parent_dir/
#if [ ! -d $basepath ]; then
#    exit -1
#fi
#echo "copy the wars to de temp dir in $basepath"
#cp  -arf $basepath/* $temp_dir/webapps;
checkFunctions

echo "Copy config file to $ip"
echo "Determine whether remote directory exists"
#read user;
ssh $user@$ip "if [ ! -d $tomcat_dir ]; then
mkdir -p -m 755 $tomcat_dir
echo "mkdir -p -m 755 ${tomcat_dir} done"
	else echo "${tomcat_dir} exists"
	fi;echo "clear $tomcat_dir dir"
	rm -rf  $tomcat_dir/*
echo "clear $tomcat_dir dir done"
#;if [ ! -d $images_dir ]; then
#  mkdir -p -m 755 $images_dir
#  echo "mkdir -p -m 755 ${images_dir} done"
	#  else echo "${images_dir} exists"
	#fi
	"
checkFunctions
echo "copying tomcat files"
scp -r $temp_dir/* $user@$ip:$tomcat_dir
checkFunctions
echo "copying tomcat files done"

echo "Remove temple file"
rm -rf $temp_dir
checkFunctions
echo "rm done"

#echo "Coping image"
#scp -r $local_images_dir/$image_name $user@$ip:$images_dir
#echo "Cope image done"
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
ssh $user@$ip "docker run -d --net=host --log-opt max-size=1m --log-opt max-file=3 --restart=always -v /etc/localtime:/etc/localtime:ro -v $tomcat_dir/webapps:/usr/local/tomcat/webapps -v $tomcat_dir/logs/:/usr/local/tomcat/logs/ --name tomcat $repository_addr/tomcat:${arr[$tag-1]}"
checkFunctions
echo "run docker done"
