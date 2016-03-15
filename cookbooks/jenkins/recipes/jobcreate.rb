xml = File.join(Chef::Config[:file_cache_path], 'rconfig.xml')

template xml do
  source 'jconfig.xml.erb'
end

jenkins_job 'project' do
  config xml
action :create
end



