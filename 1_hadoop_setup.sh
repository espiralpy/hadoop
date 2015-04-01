#!/bin/bash
#Author: Ariana Yadira Lugo Ruiz
#
echo "Installing tools"
echo "hadoop" | sudo -S apt-get install crudini -y

#1.-Instalando openssh-server
echo "------Instalando openssh-server"
echo hadoop | sudo -S apt-get install openssh-server -y

#2.-Haciendo update en el repositorio ubuntu
echo "------Actualizando repositorio"
echo hadoop | sudo -S apt-get update

#3.-Instalando java
echo "------Instalando Java"
tar -xvf jdk-7u75-linux-x64.tar.gz
echo hadoop | sudo -S mkdir /usr/local/java
echo hadoop | sudo -S cp -r /home/hadoopuser/hadoopsettest/jdk1.7.0_75 /usr/local/java

#export variables enviroment of Java
export JAVA_HOME=/usr/local/java/jdk1.7.0_75
export PATH=$PATH:$HOME/bin:$JAVA_HOME/bin

echo hadoop | sudo -S chmod 777 /etc/profile
echo hadoop | sudo -S echo JAVA_HOME=/usr/local/java/jdk1.7.0_75 >> /etc/profile
echo hadoop | sudo -S echo PATH=$PATH:$HOME/bin:$JAVA_HOME/bin >> /etc/profile
echo hadoop | sudo -S echo export JAVA_HOME >> /etc/profile
echo hadoop | sudo -S echo export PATH >> /etc/profile

echo hadoop | sudo -S update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/jdk1.7.0_75/bin/java" 1
echo hadoop | sudo -S update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/java/jdk1.7.0_75/bin/javac" 1
echo hadoop | sudo -S update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/local/java/jdk1.7.0_75/bin/javaws" 1

echo hadoop | sudo -S update-alternatives --set java /usr/local/java/jdk1.7.0_75/bin/java
echo hadoop | sudo -S update-alternatives --set javac /usr/local/java/jdk1.7.0_75/bin/javac
echo hadoop | sudo -S update-alternatives --set javaws /usr/local/java/jdk1.7.0_75/bin/javaws

. /etc/profile
java -version

#4.-Agregando usurio hadoop a grupo
echo "------Agregando usuario hadoop a grupo"
echo hadoop | sudo -S addgroup hadoop
sudo sh -c 'useradd -g hadoop -d /home/hduser -m -s /bin/bash hduser &'
sleep 2
sudo sh -c 'echo "hadoop\nhadoop\n" | passwd hduser &'
sudo sh -c 'adduser hduser hadoop &'
sudo sh -c 'chown hduser:hadoop /home/hduser/ &'

echo "------Creando ssh keys id_rsa"
su -l hduser  -c 'echo "id_rsa" | ssh-keygen -t rsa -P ""'  

echo "------Creando path .ssh"
su -l hduser  -c 'mkdir $HOME/.ssh'

echo "------Copiando ssh key > authorized_keys"
echo hadoop | sudo -S cp /home/hduser/id_rsa /home/hduser/.ssh/id_rsa
echo hadoop | sudo -S cp /home/hduser/id_rsa.pub /home/hduser/.ssh/id_rsa.pub
su -l hduser  -c 'cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys &'

echo "Crear archivo 2_hadoop_ssh_local.sh"
su -l hduser -c ' cat <<EOL > 2_hadoop_ssh_local.sh
!/bin/bash
ssh hduser@localhost
EOL'

echo "Dar permisos xrw a 2_hadoop_ssh_local.sh"
su -l hduser -c 'chmod +x 2_hadoop_ssh_local.sh &'  
echo "... After go to su - hduser and execute 2_hadoop_ssh_local.sh "
sleep 1

echo "Disable IPV6"
echo hadoop | sudo -S chmod 666  /etc/sysctl.conf
echo hadoop | sudo -S echo "#disable ipv6" >> /etc/sysctl.conf
echo hadoop | sudo -S echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo hadoop | sudo -S echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
echo hadoop | sudo -S echo "net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf
echo hadoop | sudo -S chmod 644  /etc/sysctl.conf

echo "System will REBOOT..after "
echo hadoop | sudo -S reboot


