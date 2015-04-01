#!/bin/bash
#Autor: Ariana Yadira Lugo Ruiz
#
#Levantar variables ambiente hadoop para usuario normal
./env_bash_hadoopuser.sh

#Copiar archivo variables hadoop a user hduser
echo hadoop | sudo -S cp  /home/hadoopuser/hadoopsettest/env_bash_hduser.sh /home/hduser/
echo hadoop | sudo -S cp  /home/hadoopuser/hadoopsettest/env_hadoop_format.sh /home/hduser/5_env_hadoop_format.sh

#Ejecutar variables export en hduser
su -l hduser  -c  './env_bash_hduser.sh &'

#Reboot para refrescar cambios de variables export 
echoo hadoop | sudo -S reboot
