#! /bin/bash

parent_dir=`pwd`

#docker rpm包存放路径
dockerrpm_dir_path="$parent_dir/env/rpm/"

#config文件数组
dockerCfg="/usr/lib/systemd/system/docker.service"

#获取中心主机ip地址
centerHostIp=`cat $parent_dir/centerhost|awk 'NR==1'|sed 's/\r//g'`
echo "center hostIp：$centerHostIp"
						
#将中心主机的ip写入centerhost文件中
#修改第一行文件
echo "update files first 1s start...$parent_dir"
sed -i "1s/.*/$centerHostIp/" $parent_dir/centerhost
echo "update files first 1s end..."

#仓库端口
repository_port=`cat $parent_dir/centerhost|awk 'NR==2'|sed 's/\r//g'`
echo "center repository_port：$repository_port"

#docker配置文件
docker_execstart="dockerd"
#docker修改后配置文件
update_docker_execstart="dockerd --insecure-registry=$centerHostIp:$repository_port"

#判断docker服务是否运行
echo "is docker service running?...";
result1=$(service docker status | grep running)
if [[ $result1 == *running*  ]]
	then
	echo "docker service installed...";
	systemctl stop docker
    dockerRpm=`rpm -qa | grep docker`
    if [ ! -z "${dockerRpm}" ]
    then
        rpm -e $dockerRpm
    fi
else 
    echo "docker service not installed..."
fi
		
#执行docker rpm包
echo "docker start to install..."
rpm -ivh $dockerrpm_dir_path*.rpm --force --nodeps
echo "docker installed..."
 
#修改docker配置文件
echo "edit docker config file start..."
	sed -i "s/$docker_execstart/$update_docker_execstart/g" $dockerCfg
echo "Edit done"

echo "edit docker config file end..."

#重新启动服务
echo "restart docker service ..."

systemctl daemon-reload								#重启守护进程
systemctl restart docker							#重启docker服务
systemctl enable docker								#设置开机启动项

echo "restart docker service end..."
