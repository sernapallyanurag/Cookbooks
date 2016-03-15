# Installs Nodejs Plugin on Jenkins for Nodejs Integration

jenkins_plugin 'nodejs' do
  source 'https://updates.jenkins-ci.org/latest/nodejs.hpi'
  action :install
  notifies :restart, 'service[jenkins]', :immediately
end