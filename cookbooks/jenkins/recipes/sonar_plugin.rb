# This recipe installs and configures SonarQube and Sonar Runner on Jenkins

jenkins_plugin 'sonar' do
  source 'https://updates.jenkins-ci.org/latest/sonar.hpi'
  action :install
  notifies :restart, 'service[jenkins]', :immediately
end

