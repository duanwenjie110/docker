#! /bin/bash

parent_dir=`pwd`
echo "$parent_dir"

#docker rpm包存放路径
dockerrpm_dir_path="$parent_dir/env/rpm/"

#存放config的远程路径
s_path_dir="$parent_dir/env/volume/rpm/"

ip=$2
user=$3
checkFunctions (){
if [ $? -ne 0 ] 
then
	echo "comond execute fail"
	exit	
fi
}
#免密登录配置
passwdFree(){
echo "Password free configuration"
if test -e ~/.ssh/id_rsa -a -e ~/.ssh/id_rsa.pub
then
	scp ~/.ssh/id_rsa.pub $user@$ip:/root/.ssh/id_rsa.pub
	ssh-copy-id -i ~/.ssh/id_rsa.pub $user@$ip
else
	ssh-keygen -t rsa 
	cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
	chmod 700 ~/.ssh/
	chmod 600 ~/.ssh/authorized_keys
	scp ~/.ssh/id_rsa.pub $user@$ip:/root/.ssh/id_rsa.pub
	ssh-copy-id -i ~/.ssh/id_rsa.pub $user@$ip
fi
echo "Password free configuration done"
}
passwdFree

#检查服务运行
isDockerRunning(){
result1=$(ssh $user@$ip service docker status | grep running)
if [[ $result1 == *running*  ]]
then
	echo "docke exists..."
	exit -1
else
	echo "docker not exists..."
fi
}

#判断docker服务是否运行
echo "is docker running?...";
isDockerRunning

#远程连接后新建目录
ssh $user@$ip "if [ ! -d $s_path_dir ]; then
  mkdir -p -m 755 $s_path_dir
  echo "mkdir -p -m 755 ${s_path_dir} done"
  else echo "${s_path_dir} exists"
fi;"

config_path_file="/usr/lib/systemd/system/docker.service"
s_config_path_file="/usr/lib/systemd/system/"
#拷贝rpm文件
echo "Coping config file:scp -r $dockerrpm_dir_path* $user@$ip:$s_path_dir"
scp -r $dockerrpm_dir_path* $user@$ip:$s_path_dir
checkFunctions
echo "Cope config file done"

#执行docker rpm包
echo "docker install start..."
ssh $user@$ip "rpm -ivh $s_path_dir*.rpm --force --nodeps"
checkFunctions
echo "docker install end..."

#拷贝config文件#
echo "Coping config file:scp -r $config_path_file $user@$ip:$s_config_path_file"
scp -r $config_path_file $user@$ip:$s_config_path_file
checkFunctions
echo "Cope config file done"

#重新启动服务
echo "start docker service begin ..."

#重启守护进程#重启docker服务#设置开机启动项
ssh $user@$ip "systemctl daemon-reload;								
systemctl restart docker;								
systemctl enable docker"							
checkFunctions
echo "start docker service end..."
