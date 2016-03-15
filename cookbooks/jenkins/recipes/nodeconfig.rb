

jenkins_script 'nodejs' do
  command <<-EOH.gsub(/^ {4}/, '')
import hudson.model.*
import hudson.tools.*
import jenkins.plugins.nodejs.tools.*
import jenkins.model.*

def inst = Jenkins.getInstance()

def desc = inst.getDescriptor(jenkins.plugins.nodejs.tools.NodeJSInstallation)


def sinst = new NodeJSInstallation("node4.2.3", "/usr/local/bin/", null)
desc.setInstallations(sinst)

desc.save()

EOH
end