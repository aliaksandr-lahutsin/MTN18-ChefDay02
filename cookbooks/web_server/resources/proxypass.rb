# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html

resource_name :web_server
property :role, String, default: 'jboss7'
property :app_server_ip, String, default: '192.168.56.11'
default_action :attach

def port_jboss7
  http_port = data_bag_item('jboss7', 'http')
  port = http_port['http_port']
end

def ip_adress(node)
  node[:network][:interfaces][:enp0s8][:addresses].detect{|k,v| v[:family] == 'inet' }.first
end

action :attach do
  result = ''
  port = port_jboss7
  ip = ip_adress(node)

  search(:node, "role:#{role}").each do |conf|
    result += "server #{ip_adress(conf)}:#{port};\n"
  end

  template "/etc/nginx/conf.d/vhost.conf" do
    source "vhost.conf.erb"
    variables( servers: result,
               nginx_server: ip_adress(node))
  end

  service 'nginx' do
    action [:restart]
  end
end

action :detach do
  port = port_jboss7
  bash 'del' do
    code <<-EOH
      sed -i 's/#{app_server_ip}:#{port}/localhost/g' /etc/nginx/conf.d/vhost.conf
      EOH
  end
  service 'nginx' do
    action [:restart]
  end
end
