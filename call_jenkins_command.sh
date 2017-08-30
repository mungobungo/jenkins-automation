#!/bin/bash -ex
command=$1
pass=`sh ./get_jenkins_pass.sh`
java -jar jenkins-cli.jar -auth provisioner:$pass -s http://localhost:8080/ $command
