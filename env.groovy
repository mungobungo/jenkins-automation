import java.util.Arrays
import java.util.logging.Logger
Logger logger = Logger.getLogger("ecs-cluster")

def env = System.getenv()
//Print all the environment variables.

env.each{
logger.info(it)
} 
// You can also access the specific variable, say 'username', as show below 
String user= env['USERNAME']

logger.info(user)