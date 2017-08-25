#!/bin/bash -ex
wget -N --quiet http://127.0.0.1:8080/jnlpJars/jenkins-cli.jar
pass=`sudo cat  /root/.jenkins/secrets/initialAdminPassword`
echo 'jenkins.model.Jenkins.instance.securityRealm.createAccount("user1", "password123")' | java -jar jenkins-cli.jar -auth admin:$pass -s http://localhost:8080/ groovy =  
sh ./call_jenkins_command.sh 'install-plugin git'
sh ./call_jenkins_command.sh 'install-plugin xunit'
sh ./call_jenkins_command.sh 'install-plugin amazon-ecs'
sh ./call_jenkins_command.sh 'restart'
