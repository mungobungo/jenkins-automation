import java.util.Arrays
import jenkins.model.*
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

// You can also access the specific variable, say 'username', as show below
String arn= env['ECS_CLUSTER_ARN']
ecsCloud = new ECSCloud(
  name="ecs",
  templates=Arrays.asList(ecsTemplate),
  credentialsId=null,
  cluster=arn,
  regionName="eu-west-1",
  jenkinsUrl="https://my-jenkins2.com",
  slaveTimoutInSeconds=60
)


def clouds = instance.clouds
clouds.add(ecsCloud)
instance.save()