import java.util.Arrays
import java.util.logging.Logger
import jenkins.model.*
Logger logger = Logger.getLogger("ecs-cluster")

logger.info("Loading Jenkins")

instance = Jenkins.getInstance()


import com.cloudbees.jenkins.plugins.amazonecs.ECSCloud
def env = System.getenv()

import com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate
def ecsTemplate = new ECSTaskTemplate(
  templateName="jnlp-slave-with-docker",
  label="ecs-with-docker",
  image="jnlp-slave-with-docker:latest",
  remoteFSRoot=null,
  memorySoftReservation=2024,
  memoryHardReservation=0,
  cpu=512,
  privileged=false,
  logDriverOptions=[],
  environments=[],
  extraHosts=[],
  mountPoints=[]
)
String arn= env['ECS_CLUSTER_ARN']
String jenkinsUrl= env['JENKINS_OWN_IP']

logger.info("esc ECS_CLUSTER_ARN is ${arn} and JENKINS_OWN_IP is ${jenkinsUrl}")
// You can also access the specific variable, say 'username', as show below

ecsCloud = new ECSCloud(
  name="ecs",
  templates=Arrays.asList(ecsTemplate),
  credentialsId=null,
  cluster=arn,
  regionName="eu-west-1",
  jenkinsUrl="http://" + jenkinsUrl + ":8080",
  slaveTimoutInSeconds=60
)

instance.clouds.each{cl -> logger.info(cl.name)}
def clouds = instance.clouds
logger.info("killing all existing clouds")
clouds.removeAll{1 ==1 }
instance.save()
logger.info("adding provisioned cloud")
clouds.add(ecsCloud)
logger.info("Saving jenkins")
instance.save()
instance.clouds.each{cl -> logger.info(cl.name)}
