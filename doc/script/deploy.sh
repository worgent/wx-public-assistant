#!/bin/bash
project=wpweixin
bak_path=/mnt/tomcat/$project
tomcat_path=/opt/tomcat/apache-tomcat-7.0.57
cd $tomcat_path/wxapps
echo "1.备份"
find $bak_path -name "$project_*.tar.gz" -type f -mtime +1 -exec rm {} \;
tar -cvzf $bak_path/$project_`date +%Y-%m-%d_%H%M%S`.tar.gz $project
echo "2.解压"
rm classes -fvr
rm webapp -fvr
unzip classes.zip
unzip webapp.zip
echo "3.增量更新"
\cp webapp/* $project -fvr
\cp classes/* $project/WEB-INF/classes -fvr
\cp $project/WEB-INF/classes/SystemGlobalsProduction.properties  $project/WEB-INF/classes/SystemGlobals.properties 
echo "4.删除解压文件"
rm classes -fvr
rm webapp -fvr
cd $tomcat_path
./bin/shutdown.sh
sleep 10
./bin/startup.sh
