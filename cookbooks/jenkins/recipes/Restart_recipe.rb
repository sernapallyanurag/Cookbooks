# Restarts Jenkins server
# Required for certain plugins to load

jenkins_command 'safe-restart' do
  action :execute
end
