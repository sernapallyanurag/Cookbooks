xml = File.join(Chef::Config[:file_cache_path], 'sconfig.xml')

template xml do
  source 'sonarproject.xml.erb'
end

jenkins_job 'sonarproject' do
  config xml
action :create
end