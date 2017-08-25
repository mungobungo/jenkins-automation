#!/bin/bash -ex
sudo wget http://mirrors.jenkins-ci.org/war/2.75/jenkins.war -P /opt/
sudo chmod 644 /opt/jenkins.war
export JENKINS_HOME=/jenkins
sudo mkdir /jenkins
sudo chmod u=rwx ./install_jenkins_plugin.sh
sudo mkdir /jenkins/plugins
sudo ./install_jenkins_plugin.sh -d /jenkins/plugins -a git@3.5.1 xunit@1.102 amazon-ecs@1.11 || error_exit 'Failed to install plugins'
sudo java -jar /opt/jenkins.war &
