import java.util.Arrays
import java.util.logging.Logger
Logger logger = Logger.getLogger("ecs-cluster")

logger.info("Loading Jenkins")
import jenkins.model.*
instance = Jenkins.getInstance()


logger.info("Retrieving ecs cloud config by descriptor")
import com.cloudbees.jenkins.plugins.amazonecs.ECSCloud
ecsCloud = new ECSCloud(
  name="name",
  templates=null,
  credentialsId=null,
  cluster="arn:aws:ecs:eu-west-1:799459952255:cluster/jenkins",
  regionName="eu-west-1",
  jenkinsUrl="https://my-jenkins2.com",
  slaveTimoutInSeconds=60
)

logger.info("Gettings clouds")
def clouds = instance.clouds
clouds.add(ecsCloud)
logger.info("Saving jenkins")
instance.save()