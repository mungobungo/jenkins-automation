#!/bin/bash -ex
command=$1
pass=`sudo cat /root/.jenkins/secrets/initialAdminPassword`
java -jar jenkins-cli.jar -auth admin:$pass -s http://localhost:8080/ $command
