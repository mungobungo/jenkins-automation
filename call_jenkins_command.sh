#!/bin/bash -ex
command=$1
pass=`sh ./get_default_jenkins_pass.sh`
java -jar jenkins-cli.jar -auth admin:$pass -s http://localhost:8080/ $command
