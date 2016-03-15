# Installs Groovy and Scriptler Plugins on Jenkins
# Mandatory installation to run Groovy Configuration Scripts



jenkins_plugin 'token-macro' do 
  source 'https://updates.jenkins-ci.org/latest/token-macro.hpi'
  action :install
end

jenkins_plugin 'groovy' do 
  source 'https://updates.jenkins-ci.org/latest/groovy.hpi'
  action :install
end

jenkins_plugin 'scriptler' do
  source 'https://updates.jenkins-ci.org/latest/scriptler.hpi'
  action :install
  notifies :restart, 'service[jenkins]', :immediately
end
