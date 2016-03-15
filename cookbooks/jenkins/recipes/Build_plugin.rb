# Installs Build pipeleine plugin with its dependencies

jenkins_plugin 'parameterized-trigger' do
  source 'https://updates.jenkins-ci.org/latest/parameterized-trigger.hpi'
  action :install
end

jenkins_plugin 'jquery' do
  source 'https://updates.jenkins-ci.org/latest/jquery.hpi'
  action :install
end

jenkins_plugin 'dashboard-view' do
  source 'https://updates.jenkins-ci.org/latest/dashboard-view.hpi'
  action :install
end

jenkins_plugin 'build-pipeline-plugin' do
  source 'https://updates.jenkins-ci.org/latest/build-pipeline-plugin.hpi'
  action :install
  notifies :restart, 'service[jenkins]', :immediately
end
