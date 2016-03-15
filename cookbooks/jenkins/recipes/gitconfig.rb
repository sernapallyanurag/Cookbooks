#Jenkins plugin configuration

jenkins_script 'git' do
  command <<-EOH.gsub(/^ {4}/, '')
import jenkins.model.*

def inst = Jenkins.getInstance()

def desc = inst.getDescriptor("hudson.plugins.git.GitSCM")

desc.setGlobalConfigName("[sernapallyanurag]")
desc.setGlobalConfigEmail("[anurag.s@sonata-software.com]")

desc.save()
 EOH
end