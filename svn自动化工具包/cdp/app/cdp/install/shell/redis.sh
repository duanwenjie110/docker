#! /bin/bash
service_name="redis"
parent_dir=`pwd`
#远程挂载目录
redis_dir="$5/redis"
local_dir="$parent_dir/data/conf/redis"

#仓库地址
repository_addr="$1:$4"
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
echo "validate defalut port:6379"
port=6379
result=$(ssh $user@$ip netstat -an | grep LISTEN | grep -w $port)
#echo $result
if [[ $result != *$port*  ]]
	then
		echo "$port usable"
	else
	echo "$port unusable"
exit -1
fi

#echo "判断目标主机挂载目录是否存在"
echo $ip
ssh $user@$ip "if   test -e $redis_dir
then
echo "remote directory exists"
else
echo "remote directory  not exists,creating"
mkdir -p -m 777 $redis_dir
fi"
checkFunctions

scp -r $local_dir/*  $user@$ip:$redis_dir
checkFunctions
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
sed -i '/redis/d' warConfigInfo.ini
echo "redis: ip=$ip port=6379" >>warConfigInfo.ini
echo "run docker in $ip"
ssh $user@$ip "docker run --net=host --log-opt max-size=1m --log-opt max-file=3 --restart=always -v $redis_dir/redis.conf:/etc/redis/redis.conf -v /etc/localtime:/etc/localtime:ro -v $redis_dir/data:/data  -d --name redis $repository_addr/$service_name:${arr[$tag-1]} redis-server /etc/redis/redis.conf --appendonly yes"
checkFunctions
echo "run docker done"
