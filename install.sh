#!/bin/bash -ex
sudo apt-get update && sudo apt-get install default-jre -y
sudo apt-get install unzip -y
sudo apt-get install git -y
sudo sh -c 'echo "127.0.0.1" > /tmp/ip.txt && paste /tmp/ip.txt /etc/hostname >> /etc/hosts'
cd /tmp && git clone https://github.com/mungobungo/jenkins-automation.git && cd /tmp/jenkins-automation
wget -O jenkins.war http://mirrors.jenkins-ci.org/war/2.75/jenkins.war -P /home/ubuntu/
chmod 666 /home/ubuntu/jenkins.war
chown ubuntu /home/ubuntu/jenkins.war
export JENKINS_HOME=/home/ubuntu/jenkins
mkdir -p $JENKINS_HOME/plugins
chmod +x ./install_jenkins_plugin.sh
sudo ./install_jenkins_plugin.sh -d $JENKINS_HOME/plugins -a git@3.5.1 xunit@1.102 amazon-ecs@1.11 || error_exit 'Failed to install plugins'
sudo java -jar /home/ubuntu/jenkins.war &
sleep 60
echo "ready"