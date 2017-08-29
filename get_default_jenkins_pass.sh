#!/bin/bash -ex

JENKINS_HOME=${JENKINS_HOME:-/root/.jenkins/}
pass=`sudo cat $JENKINS_HOME/secrets/initialAdminPassword`
echo $pass