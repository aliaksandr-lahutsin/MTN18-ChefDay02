include_recipe 'ark::default'
include_recipe 'java::default'

Chef::Recipe.send(:include, Garcon)

chef_gem 'rboss' do
  compile_time(false) if respond_to?(:compile_time)
  not_if  { gem_installed? 'rboss' }
  action   :install
end

group node[:jboss][:group] do
  system node[:jboss][:system_account]
end

user node[:jboss][:user] do
  comment 'JBoss System User'
  shell   '/bin/bash'
  home     node[:jboss][:home]
  gid      node[:jboss][:group]
  system   node[:jboss][:system_account]
  action  :create
end

package 'libaio' do
  package_name value_for_platform_family(
    'rhel'   => 'libaio'
  )
end

ark 'jboss' do
  url         node[:jboss][:url]
  home_dir    node[:jboss][:home]
  owner       node[:jboss][:user]
  group       node[:jboss][:group]
  checksum    node[:jboss][:checksum]
  version     node[:jboss][:version]
  prefix_root ::File.dirname node[:jboss][:home]
end

template '/etc/init.d/jboss' do
  source value_for_platform_family(
    'rhel'   => 'jboss-init-redhat.sh.erb'
  )
  user  'root'
  group 'root'
  mode   00755
end

template '/etc/default/jboss.conf' do
  user   'root'
  group  'root'
  mode    00644
end

logrotate_app 'jboss' do
  cookbook 'logrotate'
  path   [::File.join(node[:jboss][:log][:dir], '*.log')]
  frequency node[:jboss][:log][:frequency]
  rotate    node[:jboss][:log][:rotate]
  create   "644 #{node[:jboss][:user]} #{node[:jboss][:group]}"
  only_if { node[:jboss][:log][:rotation] }
end

file ::File.join(node[:jboss][:home], '.chef_deployed') do
  owner   node[:jboss][:user]
  group   node[:jboss][:group]
  action :create_if_missing
end

service 'jboss' do
  action [:enable, :start]
end

