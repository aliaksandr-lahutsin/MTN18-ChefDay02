default['jboss7']['jboss_path'] = '/opt'
default['jboss7']['jboss_home'] = "#{node['jboss7']['jboss_path']}/jboss"
default['jboss7']['jboss_user'] = 'jboss'
default['jboss7']['jboss_group'] = 'jboss'
default['jboss7']['jboss_version'] = '7.1.1.Final'
default['jboss7']['dl_url'] = "http://download.jboss.org/jbossas/7.1/jboss-as-#{node['jboss7']['jboss_version']}/jboss-as-#{node['jboss7']['jboss_version']}.tar.gz"
default['jboss7']['ajp_port'] = 8009
#default['jboss7']['http_port'] = 8080
default['jboss7']['https_port'] = 8443
default['jboss7']['public_bind_addr'] = "#{node[:network][:interfaces][:enp0s8][:addresses].detect{|k,v| v[:family] == "inet" }.first}"
