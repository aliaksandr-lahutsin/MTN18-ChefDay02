remote_file '/opt/jboss-as-7.1.1.Final/standalone/deployments/sample.war' do
  source node['jboss']['app_url']
  action :create
end
