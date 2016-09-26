#!/usr/bin/env bash

sudo apt-get update -qq

#Installation and configuration of ActiveMQ
sudo apt-get install -y activemq -qq
sudo ln -s /etc/activemq/instances-available/main /etc/activemq/instances-enabled/main
sudo sed -e 's/<broker /<broker schedulerSupport="true" /' -i /etc/activemq/instances-enabled/main/activemq.xml
sudo service activemq restart

#Installation and configuration of Tomcat
sudo apt-get install -y tomcat7
sudo service tomcat7 stop
echo 'CATALINA_OPTS="-Xms512m -Xmx512m"' | sudo tee --append /usr/share/tomcat7/bin/setenv.sh
sudo chown -R tomcat7:tomcat7 /var/lib/tomcat7/ /usr/share/tomcat7/ /var/log/tomcat7/

#Installation and configuration of Xvfb
sudo apt-get install -y xvfb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get -f install