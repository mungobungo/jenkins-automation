def instance=jenkins.model.Jenkins.instance
instance.setSlaveAgentPort(49187)
instance.save()