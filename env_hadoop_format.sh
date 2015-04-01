#!/bin/bash
#Autor: Ariana Yadira Lugo Ruiz
#
cd /usr/local/hadoop/bin
hadoop namenode -format
cd /usr/local/hadoop/bin
hadoop-daemon.sh start namenode
jps
cd /usr/local/hadoop/bin
hadoop-daemon.sh start datanode
jps
cd /usr/local/hadoop/bin
yarn-daemon.sh start resourcemanager
jps
cd /usr/local/hadoop/bin
yarn-daemon.sh start nodemanager
jps
cd /usr/local/hadoop/bin
mr-jobhistory-daemon.sh start historyserver
jps

