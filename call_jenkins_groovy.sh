#!/bin/bash -ex
script=$1
pass=`sh ./get_jenkins_pass.sh`
cat $script | java -jar jenkins-cli.jar -auth provisioner:$pass -s http://localhost:8080/ groovy =
