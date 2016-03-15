
jenkins_script 'sonarqube' do
command <<-EOH.gsub(/^ {4}/, '')
import jenkins.model.*
import hudson.plugins.sonar.*
import hudson.plugins.sonar.model.*

def inst = Jenkins.getInstance()


def desc = inst.getDescriptor("hudson.plugins.sonar.SonarPublisher")

def sinst = new SonarInstallation("sonarqube-5.1.2",  false,
  "http://localhost:9000/",
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

def installer = new SonarRunnerInstaller("2.4")
def prop = new InstallSourceProperty([installer])
def sinst = new SonarRunnerInstallation("Default", "/opt/sonar-scanner-2.5/bin", [prop])
desc.setInstallations(sinst)

desc.save()
EOH
end