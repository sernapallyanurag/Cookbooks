# this Recipe installs and configures git plugin 

jenkins_plugin 'git-client' do 
  source 'https://updates.jenkins-ci.org/latest/git-client.hpi'
  action :install
end



jenkins_plugin 'git-server' do 
  source 'https://updates.jenkins-ci.org/latest/git-server.hpi'
  action :install
end

jenkins_plugin 'scm-api' do
  source 'https://updates.jenkins-ci.org/latest/scm-api.hpi'
  action :install
 end

jenkins_plugin 'git' do
  source 'https://updates.jenkins-ci.org/latest/git.hpi'
  action :install
  notifies :restart, 'service[jenkins]', :immediately
 end
  
