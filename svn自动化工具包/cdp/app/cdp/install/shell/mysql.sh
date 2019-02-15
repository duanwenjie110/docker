#! /bin/bash

parent_dir=`pwd`
#远程配置文件路径
remoteConfig_dir="$5/mysql"
#本地配置文件路径
local_dir="$parent_dir/data/conf/mysql"
temp_dir="$parent_dir/temp/mysqltemp"
#中心主机仓库ip端口
res_addr="$1:$4"
#目标主机ip,用户名
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
echo "validate default port:3306"
port=3306
result=$(ssh $user@$ip netstat -an | grep LISTEN | grep -w $port)
#echo $result
if [[ $result != *$port*  ]]
	then
		echo "$port usable"
	else
		echo "$port unusable"
exit -1
fi
#拷贝配置文件
#echo "准备配置各种文件"
#如果没有temp_dir目录则创建
if [ ! -d $temp_dir ]; then
	mkdir -p -m 755 $temp_dir
	checkFunctions
	# echo "sudo mkdir -p -m 755 ${temp_dir} done"
fi
cp  -arf $local_dir/* $temp_dir;
checkFunctions
#  sed -i "s/ipPort1/$ipPort1/" $temp_dir/my.cnf
#echo "文件准备完成,发送"
echo $ip
ssh $user@$ip "if   test -e $remoteConfig_dir
then
echo "remote directory exists"
else
echo "remote directory  not exists,creating"
mkdir -p -m 777 $remoteConfig_dir
fi"
checkFunctions
scp -r $temp_dir/*  $user@$ip:$remoteConfig_dir
checkFunctions
rm -rf $temp_dir
checkFunctions
echo "send files success"

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
version=$(curl -s $res_addr/v2/mysql/tags/list)
if [[ $version != *errors*  ]]
	then
		echo "docker repository mysql's version list"
	else
	echo "docker repository mysql's version not found ,exit"
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
sed -i '/mysql/d' warConfigInfo.ini
echo "mysql: ip=$ip port=3306" >>warConfigInfo.ini
#启动服务
ssh $user@$ip "docker run -d --net=host --log-opt max-size=1m --log-opt max-file=3 --restart=always -v /etc/localtime:/etc/localtime:ro -v $remoteConfig_dir/data/mysql:/var/lib/mysql -v $remoteConfig_dir/config/my.cnf:/etc/my.cnf -v $remoteConfig_dir/init:/docker-entrypoint-initdb.d/ -e MYSQL_ROOT_PASSWORD=wtoe@123456 --ulimit nofile=65536:65536 --name mysql -itd $res_addr/mysql:${arr[$tag-1]}"
#从远程仓库啦镜像