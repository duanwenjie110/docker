1.请使用 ./启动脚本 如./warserviceinstall.sh


2.warserviceinstall.sh为war包部署脚本，使用时应该注意warConfigInfo.ini中的基本信息是否齐全


3.使用warserviceinstall.sh时，当不是选择All选项时，请务必按照1，2，3的顺序安装，无论是否安装在同一台主机上；
例如有A、B、C三台装机分别安装2，1，3选项中的war包，请先选1，给B安装，再选2给A安装，最后选择3给C安装。


4.warserviceupdate.sh为升级war包脚本。无论是安装还是升级需要保证在javaWar/war文件夹中放入要安装或升级的war包。


5.执行脚本后javaWar中生成的新文件夹有war_modify,war_Backup,config。war_modify中是替换了配置文件而生成的war包；
war_Backup中是升级脚本从目标主机中备份的war包；执行了warserviceinstall.sh后config中是修改了之后的配置文件，
执行了warserviceupdate.sh后config中是从目标主机的war包中提取的配置文件。