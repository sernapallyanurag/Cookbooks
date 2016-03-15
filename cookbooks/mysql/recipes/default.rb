mysql_service 'default' do
  port '3306'
  version '5.6'
  initial_root_password 'root'
  provider Chef::Provider::MysqlService::Sysvinit
  action :create
end

mysql_service 'default' do
  action :start
end