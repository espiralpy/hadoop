#!/bin/bash
#Author: Ariana Yadira Lugo Ruiz
#
echo "------Instalando Hadoop"
echo "------Descomprimiendo paquete tar hadoop"
tar -xvf /home/hadoopuser/hadoopsettest/hadoop-2.6.0.tar.gz
mv hadoop-2.6.0 hadoop
echo "------Moving folder hadoop to /usr/local"
echo "hadoop" | sudo -S cp -r hadoop /usr/local
echo "hadoop" | sudo -S chown -R hduser:hadoop /usr/local/hadoop
echo "------Configurando YARN-SITE.XML"
echo "hadoop" | sudo -S cp /usr/local/hadoop/etc/hadoop/yarn-site.xml /usr/local/hadoop/etc/hadoop/RESPALDOyarn-site.xml
echo "hadoop" | sudo -S chmod +x /usr/local/hadoop/etc/hadoop/yarn-site.xml
sed -e 's/<configuration>/<configuration>\n<property>\n<name>yarn.nodemanager.aux-services<\/name>\n<value>mapreduce_shuffle<\/value>\n<\/property>\nFIN/g' /usr/local/hadoop/etc/hadoop/yarn-site.xml > yarn-site.xml
sed -e 's/FIN/<property>\n<name>yarn.nodemanager.aux-services.mapreduce.shuffle.class<\/name>\n<value>org.apache.hadoop.mapred.ShuffleHandler<\/value>\n<\/property>/g'  yarn-site.xml > yarn-site2.xml
rm yarn-site.xml
mv yarn-site2.xml yarn-site.xml
echo "hadoop" | sudo -S cp yarn-site.xml /usr/local/hadoop/etc/hadoop/
echo "hadoop" | sudo -S chmod 644 /usr/local/hadoop/etc/hadoop/yarn-site.xml
echo "hadoop" | sudo -S chown -R hduser:hadoop /usr/local/hadoop/etc/hadoop/yarn-site.xml
echo "------Configurando CORE-SITE.XML"
echo "hadoop" | sudo -S cp /usr/local/hadoop/etc/hadoop/core-site.xml /usr/local/hadoop/etc/hadoop/RESPALDOcore-site.xml
echo "hadoop" | sudo -S chmod +x /usr/local/hadoop/etc/hadoop/core-site.xml
sed -e 's/<configuration>/<configuration>\n<property>\n<name>fs.default.name<\/name>\n<value>hdfs:\/\/localhost:9000<\/value>\n<\/property>/g' /usr/local/hadoop/etc/hadoop/core-site.xml > core-site.xml
echo "hadoop" | sudo -S cp core-site.xml /usr/local/hadoop/etc/hadoop/
echo "hadoop" | sudo -S chmod 644 /usr/local/hadoop/etc/hadoop/core-site.xml
echo "hadoop" | sudo -S chown -R hduser:hadoop /usr/local/hadoop/etc/hadoop/core-site.xml
echo "------Configurando MAP-RED.XML"
echo "hadoop" | sudo -S cp /usr/local/hadoop/etc/hadoop/mapred-site.xml.template /usr/local/hadoop/etc/hadoop/mapred-site.xml
echo "hadoop" | sudo -S chmod +x /usr/local/hadoop/etc/hadoop/mapred-site.xml
sed -e 's/<configuration>/<configuration>\n<property>\n<name>mapreduce.framework.name<\/name>\n<value>yarn<\/value>\n<\/property>/g' /usr/local/hadoop/etc/hadoop/mapred-site.xml > mapred-site.xml
echo "hadoop" | sudo -S cp mapred-site.xml /usr/local/hadoop/etc/hadoop/
echo "hadoop" | sudo -S chmod 644 /usr/local/hadoop/etc/hadoop/mapred-site.xml
echo "hadoop" | sudo -S chown -R hduser:hadoop /usr/local/hadoop/etc/hadoop/mapred-site.xml
echo "------Configurando HDFS-SITE.XML"
echo "hadoop" | sudo -S mkdir -p /usr/local/hadoop/yarn_data/hdfs/namenode
echo "hadoop" | sudo -S mkdir -p /usr/local/hadoop/yarn_data/hdfs/datanode
echo "hadoop" | sudo -S cp /usr/local/hadoop/etc/hadoop/hdfs-site.xml /usr/local/hadoop/etc/hadoop/RESPALDOhdfs-site.xml
echo "hadoop" | sudo -S chmod +x /usr/local/hadoop/etc/hadoop/hdfs-site.xml
sed -e 's/<configuration>/<configuration>\n<property>\n<name>dfs.replication<\/name>\n<value>1<\/value>\n<\/property>\nFIN/g' /usr/local/hadoop/etc/hadoop/hdfs-site.xml > hdfs-site.xml
sed -e 's/FIN/<property>\n<name>dfs.namenode.name.dir<\/name>\n<value>file:\/usr\/local\/hadoop\/yarn_data\/hdfs\/namenode<\/value>\n<\/property>\nFIN/g'  hdfs-site.xml > hdfs-site2.xml
sed -e 's/FIN/<property>\n<name>dfs.datanode.data.dir<\/name>\n<value>file:\/usr\/local\/hadoop\/yarn_data\/hdfs\/datanode<\/value>\n<\/property>/g' hdfs-site2.xml > hdfs-site3.xml
rm hdfs-site.xml 
rm hdfs-site2.xml 
mv hdfs-site3.xml hdfs-site.xml
echo "hadoop" | sudo -S cp hdfs-site.xml /usr/local/hadoop/etc/hadoop/
echo "hadoop" | sudo -S chmod 644 /usr/local/hadoop/etc/hadoop/hdfs-site.xml
echo "hadoop" | sudo -S chown -R hduser:hadoop /usr/local/hadoop/etc/hadoop/hdfs-site.xml

