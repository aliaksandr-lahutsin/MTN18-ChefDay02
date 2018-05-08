remote_file '/tmp/sample.war' do
  source node['jboss']['app_url']
  action :create
end

execute "unpack app" do
  user node['jboss']['jboss_user']
  group node['jboss']['jboss_group']
  command "unzip -o /tmp/sample.war -d #{node['jboss']['install_path'] + node['jboss']['install_dir']}/standalone/deployments/"
end
