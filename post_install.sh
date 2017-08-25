curl http://127.0.0.1:8080/jnlpJars/jenkins-cli.jar --output jenkins-cli.jar 
pass=`sudo cat /root/.jenkins/secrets/initialAdminPassword` 
echo $pass
cat env.groovy | java -jar jenkins-cli.jar -auth admin:$pass -s http://localhost:8080/ groovy =  
echo 'jenkins.model.Jenkins.instance.securityRealm.createAccount("admin", "password123")' | sudo java -jar jenkins-cli.jar -auth admin:$pass -s http://localhost:8080/ groovy = 
echo 'jenkins.model.Jenkins.instance.securityRealm.createAccount("user1", "password123")' | sudo java -jar jenkins-cli.jar -auth admin:$pass -s http://localhost:8080/ groovy = 
cat jenkins_git.groovy | java -jar jenkins-cli.jar -auth admin:$pass -s http://localhost:8080/ groovy =  
cat setup_cloud.groovy | java -jar jenkins-cli.jar -auth admin:$pass -s http://localhost:8080/ groovy =  
echo 'DONE'