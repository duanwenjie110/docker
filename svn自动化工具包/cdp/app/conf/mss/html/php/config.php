<?php 
#只需要修改如下内容
const localIp = 'localIpAddr';
const uploadPort = localPort1;
const playPort = localPort2;
#总存储容量
const totalSpace = storeSpace * 1024; #5G 单位M
#mss安装目录
const MSSPATH = '/usr/local/nginx-mss/';

const DBIP = 'mysqlIp';
const DBPort = '3306';
const DBUserName = 'user';
const DBPassword = 'wtoe@123456';

const DBName='wt-sso';
const DBTable='biz_file';
const DBConnectTimeout=5;


#日志文件路径
const LOGPATH = MSSPATH.'/logs/mss.log';
#mss存放临时文件、状态文件和正式文件的父目录，请将tmp目录和work目录设置在此目录下，以便统一获取空闲容量
const SAVEPATH = '/home/store';
const tempPath =  '/home/store/tmp';
const workPath =  '/home/store/work';

#禁用PHP错误报告
error_reporting(0);

?>
