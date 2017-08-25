#!/bin/bash -ex
sudo curl http://127.0.0.1:8080/jnlpJars/jenkins-cli.jar --output jenkins-cli.jar
pass=`sudo cat  /root/.jenkins/secrets/initialAdminPassword` 
echo 'jenkins.model.Jenkins.instance.securityRealm.createAccount("user1", "password123")' | sudo java -jar jenkins-cli.jar -auth admin:$pass -s http://localhost:8080/ groovy = \
java -jar jenkins-cli.jar -auth admin:$pass -s http://localhost:8080/ install-plugin git
java -jar jenkins-cli.jar -auth admin:$pass -s http://localhost:8080/ install-plugin xunit
java -jar jenkins-cli.jar -auth admin:$pass -s http://localhost:8080/ install-plugin amazon-ecs
java -jar jenkins-cli.jar -auth admin:$pass -s http://localhost:8080/ restart
