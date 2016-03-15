
xml = File.join(Chef::Config[:file_cache_path], 'tconfig.xml')

template xml do
  source 'testunit.xml.erb'
end

jenkins_job 'testunit' do
  config xml
action :create
end