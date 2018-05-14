
remote_file "#{node['jboss7']['jboss_home']}/standalone/deployments/sample.war" do
  source "#{node['application_repo']}"
  notifies :restart, 'service[jboss7]', :delayed
end
