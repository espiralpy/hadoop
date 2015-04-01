#!/bin/bash
#Autor: Ariana Yadira Lugo Ruiz
#
echo "export HADOOP_PREFIX=/usr/local/hadoop" >> .bashrc
echo "export HADOOP_HOME=/usr/local/hadoop" >> .bashrc
echo "export HADOOP_MAPRED_HOME=\${HADOOP_HOME}" >> .bashrc
echo "export HADOOP_COMMON_HOME=\${HADOOP_HOME}" >> .bashrc
echo "export HADOOP_HDFS_HOME=\${HADOOP_HOME}" >> .bashrc
echo "export YARN_HOME=\${HADOOP_HOME}" >> .bashrc
echo "export HADOOP_CONF_DIR=\${HADOOP_HOME}/etc/hadoop" >> .bashrc
echo "# Native Path" >> .bashrc
echo "export HADOOP_COMMON_LIB_NATIVE_DIR=\${HADOOP_PREFIX}/lib/native" >> .bashrc
echo 'export HADOOP_OPTS="-Djava.library.path=$HADOOP_PREFIX/lib"' >> .bashrc
echo "#Java path" >> .bashrc
echo "export JAVA_HOME='/usr/local/java/jdk1.7.0_75'" >> .bashrc
echo "# Add Hadoop bin/ directory to PATH" >> .bashrc
echo "export PATH=\$PATH:\$HADOOP_HOME/bin:\$JAVA_PATH/bin:\$HADOOP_HOME/sbin" >> .bashrc

