#!/bin/bash -ex
sudo wget -N http://mirrors.jenkins-ci.org/war/2.75/jenkins.war -P /opt/
sudo chmod 644 /opt/jenkins.war
export JENKINS_HOME=/jenkins
sudo mkdir -p /jenkins
sudo chmod +x ./install_jenkins_plugins.sh
sudo mkdir -p /jenkins/plugins
sudo ./install_jenkins_plugins.sh -d /jenkins/plugins -a git@3.5.1 xunit@1.102 amazon-ecs@1.11 || error_exit 'Failed to install plugins'
sudo java -jar /opt/jenkins.war &
