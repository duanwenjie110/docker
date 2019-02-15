#!/bin/bash


#-linux-pis-V1.0.0H1.0.0.tar.bz2
#----pis
#-----|-images
#---------|-java
#-------------|----tomcat-V1.0.0H1.0.0.tar
#-------------|-....................
#---------|-cpp
#------------|---cms
#------------|-....................
#---------|-registry-V1.0.0H1.0.0.tar(cangku)
#-----|-data
#---------|-conf
#-------------|-cms 
#-------------|-mds
#---------|-war
#-------------|-javaCms.tar
#-------------|-...........
#-----|-env
#--------|-rpm
#-----------|-*.rpm
#-----------|-...........
#-----|javaWar
#--------|-war
#--------|-script
#-----|-shell
#---------|---cms.sh
#---------|-........
#-----*.sh
#-----host

#debug
set -xv
set -e

#defind same var
curPath=`pwd`
dateSuf=`date "+%Y-%m-%d-%H-%M-%S"`
prjVersion="V1.0.0H1.0.1"
baseToolPath="/usr/3rdlibsPis/projects/docker/tools/"
baseImages="${baseToolPath}base"
dockerFile="${baseToolPath}dockerfile"
confFile="${baseToolPath}conf"
envFile="${baseToolPath}env"
shellFile="${baseToolPath}cdp/install"

prjRoot="/usr/local"
prjName="pis"
prjDocker="docker"
prjDockerData="data"
prjDockerImage="images"
prjCppImage="cpp"
prjJavaImage="java"
prjDockerDataConf="conf"
prjDockerDataWar="war"
prjDockerShell="shell"

prjPath=${prjRoot}/${prjName}

prjDockerPath=${prjRoot}/${prjDocker}${dateSuf}
prjDockerImagePath=${prjDockerPath}/${prjDockerImage}
prjDockerImageJavaPath=${prjDockerImagePath}/${prjJavaImage}
prjDockerImageCppPath=${prjDockerImagePath}/${prjCppImage}
prjDockerDataPath=${prjDockerPath}/${prjDockerData}
prjDockerDataConfPath=${prjDockerPath}/${prjDockerData}/${prjDockerDataConf}
#prjDockerDataWarPath=${prjDockerPath}/${prjDockerData}/${prjDockerDataWar}
prjDockerShellPath=${prjDockerPath}/${prjDockerShell}


#check prj dir
if [ ! -d $prjPath ]
then
    echo "Source dir is not exist!"
    exit -2
fi


#rm prev product
rm -rf ${prjRoot}/${prjName}-${prjVersion}

#creat docker prj
if [ -d ${prjDockerPath} ]
then
    rm -rf ${prjDockerPath}
else
    mkdir -p $prjDockerImagePath
    mkdir -p $prjDockerDataPath
    mkdir -p $prjDockerDataConfPath
    #mkdir -p $prjDockerDataWarPath
    mkdir -p $prjDockerShellPath
fi

#step0 copy docker env to docker
cp -arf ${envFile} ${prjDockerPath}

#step1 copy base images include(cpp ,java, registry) and dockerfile
cp -arf ${baseImages}/* ${prjDockerImagePath}
cp -arf ${dockerFile}/* ${prjDockerImageCppPath}
#step1.1 freeswitch add version info
freeswitchVerison=`cat ${curPath}/${prjVersion}|grep freeswitch`
freeswitchVerison=${freeswitchVerison##*:}
echo ${freeswitchVerison} >> ${prjDockerImageCppPath}/freeswitch/version

#step2 copy conf file to data/conf
cp -arf ${confFile}/* ${prjDockerDataConfPath}

#step3 copy shell scrpit
chmod a+x -R ${shellFile}/*
cp -arf ${shellFile}/* ${prjDockerPath}

#step4 cd prj dir and tar cpp binary and copy to cpp/cms/*
cd ${prjPath}
#step5.1 remove exist tar pacakge
rm -rf linux-*
for prj in `ls`
do
    localTar="linux-${prj}.tar.bz2"
    if [ $prj == "war" ]
    then
        #copy war 包
        cp -arf $prj/* ${prjDockerPath}/javaWar/war/
        continue
    fi
    
    if [ $prj == "mds" ]
    then
        cd ./$prj
        cp svnChange nginx-mds
        tar -jcf ${localTar} nginx-mds shell
        mv ${localTar} ../
        cd ../
    elif [ $prj == "mss" ]
    then
        cd ./$prj
        cp svnChange nginx-mss
        tar -jcf ${localTar} nginx-mss shell
        mv ${localTar} ../
        cd ../
    else
        tar -jcf ${localTar} $prj 
    fi
    
    if [ $prj == "ccs" ]
    then
        # copy ccs to freeswitch dir
        cp -arf ${localTar} ${prjDockerImageCppPath}/freeswitch/
    else
        cp -arf ${localTar} ${prjDockerImageCppPath}/${prj}
        cppVerison=`cat ${curPath}/${prjVersion}|grep ${prj}`
        echo ${cppVerison##*:} >> ${prjDockerImageCppPath}/${prj}/version
    fi
done

#step8 copy file
cd ${prjDockerPath}/../
mv ${prjDockerPath} ${prjName}-${prjVersion}

#step9 copy shell script and another
echo ${prjVersion} >> ${prjName}-${prjVersion}/version

#tar linux-pis-V1.0.0H1.0.0.tar.bz2
echo "begin tar pis product linux-${prjName}-${prjVersion}.tar.bz2"
tar -jcf linux-${prjName}-${prjVersion}.tar.bz2 ${prjName}-${prjVersion}
#rm -rf ${prjName}-${prjVersion}
localPwd=`pwd`
echo "pis product exist [ ${localPwd} ]"
cd ${curPath}
echo "product publish end"

