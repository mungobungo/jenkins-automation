#!/bin/bash -ex
sudo wget -O /home/ubuntu/jenkins.war http://mirrors.jenkins-ci.org/war/2.75/jenkins.war -P /home/ubuntu/
sudo chmod 666 /home/ubuntu/jenkins.war
sudo chown ubuntu /home/ubuntu/jenkins.war
export JENKINS_HOME=/home/ubuntu/jenkins
mkdir -p $JENKINS_HOME/plugins
chmod +x ./install_jenkins_plugins.sh
sudo ./install_jenkins_plugins.sh -d $JENKINS_HOME/plugins -a git@3.5.1 xunit@1.102 amazon-ecs@1.11 || error_exit 'Failed to install plugins'
sudo java -jar /home/ubuntu/jenkins.war &
sleep 60
echo "ready"
