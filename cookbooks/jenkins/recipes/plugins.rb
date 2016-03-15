
#node['jenkins']['master']['plugins']['install']
jenkins_plugin 'git' do
  source 'https://updates.jenkins-ci.org/download/plugins/git/2.4.1/git.hpi'
  action :install
  
end

jenkins_plugin 'sonar' do
  source 'https://updates.jenkins-ci.org/download/plugins/sonar/2.3/sonar.hpi'
  action :install
end

jenkins_plugin 'groovy' do 
  source 'https://updates.jenkins-ci.org/download/plugins/groovy/1.29/groovy.hpi'
  action :install
end

jenkins_plugin 'scriptler' do
  source 'https://updates.jenkins-ci.org/download/plugins/scriptler/2.9/scriptler.hpi'
  action :install
end

jenkins_plugin 'parameterized-trigger' do
  source 'https://updates.jenkins-ci.org/download/plugins/parameterized-trigger/2.30/parameterized-trigger.hpi'
  action :install
end

jenkins_plugin 'jquery' do
  source 'https://updates.jenkins-ci.org/download/plugins/jquery/1.11.2-0/jquery.hpi'
  action :install
end

jenkins_plugin 'dashboard-view' do
  source 'https://updates.jenkins-ci.org/download/plugins/dashboard-view/2.9.7/dashboard-view.hpi'
  action :install
end


jenkins_plugin 'nodejs' do
  source 'https://updates.jenkins-ci.org/download/plugins/nodejs/0.2.1/nodejs.hpi'
  action :install
end

jenkins_plugin 'build-pipeline-plugin' do
  source 'https://updates.jenkins-ci.org/download/plugins/build-pipeline-plugin/1.4.9/build-pipeline-plugin.hpi'
  action :install
end


jenkins_script 'git' do
  command <<-EOH.gsub(/^ {4}/, '')
import jenkins.model.*

def inst = Jenkins.getInstance()

def desc = inst.getDescriptor("hudson.plugins.git.GitSCM")

desc.setGlobalConfigName("Sernapally Anurag")
desc.setGlobalConfigEmail("[anurag.s@sonata-software.com]")

desc.save()
 EOH
end



jenkins_script 'sonarqube' do
command <<-EOH.gsub(/^ {4}/, '')
import jenkins.model.*
import hudson.plugins.sonar.*
import hudson.plugins.sonar.model.*

def inst = Jenkins.getInstance()


def desc = inst.getDescriptor("hudson.plugins.sonar.SonarPublisher")

def sinst = new SonarInstallation("sonarqube-5.1.2",  false,
  "http://sonatadeploy.cloudapp.net:9000/",
  "jdbc:mysql://localhost:3306/sonar", "root", "root",
  "2.7.1",  "", new TriggersConfig(),
  "admin",
  "admin",
  "")

desc.setInstallations(sinst)

desc.save()
EOH

end

jenkins_script 'sonar runner' do
  command <<-EOH.gsub(/^ {4}/, '')
import jenkins.model.*
import hudson.plugins.sonar.*
import hudson.tools.*

def inst = Jenkins.getInstance()

def desc = inst.getDescriptor("hudson.plugins.sonar.SonarRunnerInstallation")

def installer = new SonarRunnerInstaller("[sonar runner version]")
def prop = new InstallSourceProperty([installer])
def sinst = new SonarRunnerInstallation("Default", "", [prop])
desc.setInstallations(sinst)

desc.save()
EOH
end

service "jenkins" do
  action :restart
end
