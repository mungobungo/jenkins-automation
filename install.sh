#!/bin/bash -ex
sudo wget -O /opt/jenkins.war http://mirrors.jenkins-ci.org/war/2.75/jenkins.war -P /opt/
export JENKINS_HOME=/opt/jenkins
mkdir -p /.jenkins/plugins/plugins
chmod +x ./install_jenkins_plugins.sh
chmod +x ./post_install.sh
sudo ./install_jenkins_plugins.sh -d /.jenkins/plugins/plugins -a git@3.5.1 xunit@1.102 amazon-ecs@1.11 || error_exit 'Failed to install plugins'
sudo java -jar /opt/jenkins.war &
sleep 60s && ./post_install.sh && echo "ready"
