#!/bin/bash -ex
script=$1
pass=`sh ./get_default_jenkins_pass.sh`
cat $script | java -jar jenkins-cli.jar -auth admin:$pass -s http://localhost:8080/ groovy =
