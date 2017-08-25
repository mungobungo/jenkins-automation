import jenkins.model.*

def inst = Jenkins.getInstance()

def desc = inst.getDescriptor("hudson.plugins.git.GitSCM")

desc.setGlobalConfigName("jenkins build server")
desc.setGlobalConfigEmail("jenkins@noname.com")

desc.save() 