#! /bin/bash
#中心主机仓库ip端口
res_addr="$1:$4"
#目标主机ip,用户名
ip=$2
user=$3
stty erase ^H

echo "validate default port:5672"
port=5672
result=$(ssh $user@$ip netstat -an | grep LISTEN | grep -w $port)
#echo $result
if [[ $result != *$port*  ]]
	then
		echo "$port usable"
	else
		echo "$port unusable"
exit -1
fi

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
version=$(curl -s $res_addr/v2/rabbitmq/tags/list)
if [[ $version != *errors*  ]]
	then
		echo "docker repository rabbitmq's version list"
	else
	echo "docker repository rabbitmq's version not found ,exit"
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
sed -i '/rabbitmq/d' warConfigInfo.ini
echo "rabbitmq: ip=$ip port=5672" >>warConfigInfo.ini
#启动服务
ssh $user@$ip "docker run -d --net=host --log-opt max-size=1m --log-opt max-file=3 --restart=always -e RABBITMQ_DEFAULT_USER=admin -e RABBITMQ_DEFAULT_PASS=wtoe@123456 -e RABBITMQ_DEFAULT_VHOST=/vhost_jwzh --name=rabbitmq -itd $res_addr/rabbitmq:${arr[$tag-1]}"