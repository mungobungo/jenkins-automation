#!/bin/bash -ex
script=$1
pass=`sudo cat  /root/.jenkins/secrets/initialAdminPassword`
cat $script | java -jar jenkins-cli.jar -auth admin:$pass -s http://localhost:8080/ groovy =
