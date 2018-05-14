
include_recipe 'java'

user node['jboss7']['jboss_user'] do
  comment 'jboss User'
  home node['jboss7']['jboss_home']
  system true
  shell '/bin/false'
end

group node['jboss7']['jboss_group'] do
  action :create
end

ark 'jboss' do
  url node['jboss7']['dl_url']
  home_dir node['jboss7']['jboss_home']
  prefix_root node['jboss7']['jboss_path']
  owner node['jboss7']['jboss_user']
  version node['jboss7']['jboss_version']
end

http_port = data_bag_item('jboss7', 'http')
template "#{node['jboss7']['jboss_home']}/standalone/configuration/standalone.xml" do
  source 'standalone_xml.erb'
  owner node['jboss7']['jboss_user']
  group node['jboss7']['jboss_group']
  mode '0644'
  notifies :restart, 'service[jboss7]', :delayed
  variables( http_port: http_port['http_port'])
end

template '/etc/init.d/jboss7' do
  source "jboss7-init.erb"
  mode 0775
  owner 'root'
  group node['root_group']
  notifies :enable, 'service[jboss7]', :delayed
  notifies :restart, 'service[jboss7]', :delayed
end

service 'jboss7' do
  action :enable
end
