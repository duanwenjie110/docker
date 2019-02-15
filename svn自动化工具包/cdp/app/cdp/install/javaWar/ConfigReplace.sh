#!/bin/bash
war=".war"
cfg_bkup="config"
warfile="war"
new_warfile="war_modify"
web_inf="WEB-INF"
classes="classes"
stat="static"
cfg="config.js"
j=".jar"
warpack=(0 background javaCms jwzh mq-jwzh socketio-jwzh stream-loadbalance-jwzh vod-loadbalance-jwzh view-jwzh solr)
path=$1/javaWar

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
if [  -e $path/$warfile/$1 ]
then
echo " "
else
echo "$1 not exist, please check"
exit	
fi
}

#处理除了backgound和jwzh以外的war包
funcwar1(){
	checkWarExsit ${warpack[$1]}$war
	echo ${warpack[$1]}
	#创建文件夹，用作临时存放解压的文件。必须先创建，否则unzip会失败。下同
	mkdir -p $path/$new_warfile/${warpack[$1]}
	#解压war包
	unzip -o $path/$warfile/${warpack[$1]}$war -d $path/$new_warfile/${warpack[$1]}
	
	#如果不等于7，即不是选择vod-loadbalance-jwzh，就需要替换配置文件
	if [ $1 -ne 7 ] && [ $1 -ne 8 ]
	then
		if [ $1 -eq 9 ] 
		then
			\cp -arf $path/$cfg_bkup/${warpack[$1]}/* $path/$new_warfile/${warpack[$1]}/solr-home/jwzhMap/conf/
		#替换配置文件
		else
			\cp -arf $path/$cfg_bkup/${warpack[$1]}/* $path/$new_warfile/${warpack[$1]}/$web_inf/$classes
		fi
	fi
	cd $path/$new_warfile/${warpack[$1]}
	#重新压缩成war包
	zip -qr ${warpack[$1]}$war ./*
	#移动到上一层
	mv ${warpack[$1]}$war ../
	cd ..
	#删除临时文件夹
	rm -rf ${warpack[$1]}
}

#处理background
funcwar(){
	checkWarExsit ${warpack[1]}$war 
	#创建文件夹，用作临时存放解压的文件
	mkdir -p $path/$new_warfile/${warpack[1]}/$web_inf/lib/server-background-1.0.0.1
	mkdir -p $path/$new_warfile/${warpack[1]}/$web_inf/lib/server-common-1.0.0.1
	#解压war包
	unzip $path/$warfile/${warpack[1]}$war -d $path/$new_warfile/${warpack[1]}
	#解压jar包
	unzip $path/$new_warfile/${warpack[1]}/$web_inf/lib/server-background-1.0.0.1$j  -d  $path/$new_warfile/${warpack[1]}/$web_inf/lib/server-background-1.0.0.1
	unzip $path/$new_warfile/${warpack[1]}/$web_inf/lib/server-common-1.0.0.1$j  -d  $path/$new_warfile/${warpack[1]}/$web_inf/lib/server-common-1.0.0.1
	
	#替换配置文件
	\cp -arf $path/$cfg_bkup/${warpack[1]}/server-background-1.0.0.1/* $path/$new_warfile/${warpack[1]}/$web_inf/lib/server-background-1.0.0.1/
	\cp -arf $path/$cfg_bkup/${warpack[1]}/server-common-1.0.0.1/* $path/$new_warfile/${warpack[1]}/$web_inf/lib/server-common-1.0.0.1/
	
	#删除原来的jar
	rm -rf $path/$new_warfile/${warpack[1]}/$web_inf/lib/server-background-1.0.0.1$j
	rm -rf $path/$new_warfile/${warpack[1]}/$web_inf/lib/server-common-1.0.0.1$j
	
	cd $path/$new_warfile/${warpack[1]}/$web_inf/lib/server-background-1.0.0.1
	#重新压缩成jar包
	zip -qr server-background-1.0.0.1$j ./*
	mv server-background-1.0.0.1$j ../
	rm -rf $path/$new_warfile/${warpack[1]}/$web_inf/lib/server-background-1.0.0.1
	
	cd $path/$new_warfile/${warpack[1]}/$web_inf/lib/server-common-1.0.0.1
	#重新压缩成jar包
	zip -qr server-common-1.0.0.1$j ./*
	mv server-common-1.0.0.1$j ../
	rm -rf $path/$new_warfile/${warpack[1]}/$web_inf/lib/server-common-1.0.0.1
	
	cd $path/$new_warfile/${warpack[1]}
	#重新压缩成war包
	zip -qr ${warpack[1]}$war ./*
	mv ${warpack[1]}$war ../
	cd ..
	rm -rf ${warpack[1]}
}


#处理jwzh.war

funcwar3(){
    checkWarExsit ${warpack[3]}$war
	#创建文件夹，用作临时存放解压的文件
	mkdir -p $path/$new_warfile/${warpack[3]}/$web_inf/lib/server-jwzh-1.0.0.1
	mkdir -p $path/$new_warfile/${warpack[3]}/$web_inf/lib/server-common-1.0.0.1
	
	#解压war包
	unzip $path/$warfile/${warpack[3]}$war -d $path/$new_warfile/${warpack[3]}
	
	#替换配置文件
	\cp -arf $path/$cfg_bkup/${warpack[3]}/$stat/* $path/$new_warfile/${warpack[3]}/$stat/

	#解压jar包
	unzip $path/$new_warfile/${warpack[3]}/$web_inf/lib/server-jwzh-1.0.0.1$j  -d  $path/$new_warfile/${warpack[3]}/$web_inf/lib/server-jwzh-1.0.0.1
	unzip $path/$new_warfile/${warpack[3]}/$web_inf/lib/server-common-1.0.0.1$j  -d  $path/$new_warfile/${warpack[3]}/$web_inf/lib/server-common-1.0.0.1

	#替换配置文件
	\cp -arf $path/$cfg_bkup/${warpack[3]}/server-jwzh-1.0.0.1/* $path/$new_warfile/${warpack[3]}/$web_inf/lib/server-jwzh-1.0.0.1/
	\cp -arf $path/$cfg_bkup/${warpack[3]}/server-common-1.0.0.1/* $path/$new_warfile/${warpack[3]}/$web_inf/lib/server-common-1.0.0.1/

	#原来的jar
	rm -rf $path/$new_warfile/${warpack[3]}/$web_inf/lib/server-jwzh-1.0.0.1$j
	rm -rf $path/$new_warfile/${warpack[3]}/$web_inf/lib/server-common-1.0.0.1$j

	cd $path/$new_warfile/${warpack[3]}/$web_inf/lib/server-jwzh-1.0.0.1
	#重新压缩成jar包
	zip -qr server-jwzh-1.0.0.1$j ./*
	mv server-jwzh-1.0.0.1$j ../
	rm -rf $path/$new_warfile/${warpack[3]}/$web_inf/lib/server-jwzh-1.0.0.1

	cd $path/$new_warfile/${warpack[3]}/$web_inf/lib/server-common-1.0.0.1
	#重新压缩成jar包
	zip -qr server-common-1.0.0.1$j ./*
	mv server-common-1.0.0.1$j ../
	rm -rf $path/$new_warfile/${warpack[3]}/$web_inf/lib/server-common-1.0.0.1

	cd $path/$new_warfile/${warpack[3]}
	#重新压缩成war包
	zip -qr ${warpack[3]}$war ./*
	mv ${warpack[3]}$war ../
	cd ..
	rm -rf ${warpack[3]}
}


funcwar9(){
    funcwar
	checkFunctions
    funcwar1 2
	checkFunctions
    funcwar3
	checkFunctions
    funcwar1 4
	checkFunctions
    funcwar1 5
	checkFunctions
    funcwar1 6
	checkFunctions
    funcwar1 7
	checkFunctions
	funcwar1 8
	checkFunctions
	funcwar1 9
	checkFunctions
}

choice=$2
if [ $choice == "socketio-jwzh/jwzh/background/view-jwzh" ]
then
    funcwar
	checkFunctions
	funcwar3
	checkFunctions
	funcwar1 5
	checkFunctions
	funcwar1 8
	checkFunctions
elif [ $choice == "javaCms/mq-jwzh" ]
then
	funcwar1 2
	checkFunctions
	funcwar1 4
	checkFunctions
elif [ $choice == "stream-loadbalance-jwzh/vod-loadbalance-jwzh" ]
then
    funcwar1 6
	checkFunctions
	funcwar1 7
	checkFunctions
elif [ $choice == "All" ]
then
    funcwar9
	checkFunctions
elif [[ $choice == "background.war" ]]
then
	funcwar
	checkFunctions
elif [[ $choice == "javaCms.war" ]]
then
	funcwar1 2
	checkFunctions
elif [[ $choice == "jwzh.war" ]]
then
	funcwar3
	checkFunctions
elif [[ $choice == "mq-jwzh.war" ]]
then
	funcwar1 4
	checkFunctions
elif [[ $choice == "socketio-jwzh.war" ]]
then
	funcwar1 5
	checkFunctions
elif [[ $choice == "stream-loadbalance-jwzh.war" ]]
then
	funcwar1 6
	checkFunctions
elif [[ $choice == "vod-loadbalance-jwzh.war" ]]
then
	funcwar1 7
	checkFunctions
elif [[ $choice == "view-jwzh.war" ]]
then
	funcwar1 8
	checkFunctions
elif [[ $choice == "solr" ]]
then
	funcwar1 9
	checkFunctions
elif [[ $choice == "solr.war" ]]
then
	funcwar1 9
	checkFunctions
elif [ $choice == 0 ]
then
    echo "quit modify"
    exit
else
    echo ""
fi

#basepath=$path/$new_warfile
#echo "modify war path [ $basepath ]"
