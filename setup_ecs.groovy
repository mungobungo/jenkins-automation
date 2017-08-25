import java.util.Arrays
import java.util.logging.Logger
Logger logger = Logger.getLogger("ecs-cluster")

logger.info("Loading Jenkins")
import jenkins.model.*
instance = Jenkins.getInstance()


logger.info("Retrieving ecs cloud config by descriptor")
import com.cloudbees.jenkins.plugins.amazonecs.ECSCloud
def env = System.getenv()
//Print all the environment variables.

// You can also access the specific variable, say 'username', as show below 
String arn= env['ECS_CLUSTER_ARN']
ecsCloud = new ECSCloud(
  name="name",
  templates=null,
  credentialsId=null,
  cluster=arn,
  regionName="eu-west-1",
  jenkinsUrl="https://my-jenkins2.com",
  slaveTimoutInSeconds=60
)

logger.info("Gettings clouds")
def clouds = instance.clouds
clouds.add(ecsCloud)
logger.info("Saving jenkins")
instance.save()