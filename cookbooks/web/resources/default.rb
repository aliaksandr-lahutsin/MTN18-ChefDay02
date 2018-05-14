actions :install, :setup, :stop, :start, :restart, :reload, :attach, :detach
attribute :name, :kind_of => String, :name_attribute => true
attribute :some_fun, :kind_of => String
property :role, String, default: 'app_server'
property :del_server, String, default: '192.168.10.12'

action :attach do
  result = ""
  search(:node, 'role:app_server').each do |node|
    p node['ipaddress']
    result += "server #{node[:network][:interfaces][:enp0s8][:addresses].detect{|k,v| v[:family] == 'inet' }.first}:8095; "
  end

  ip = node[:network][:interfaces][:enp0s8][:addresses].detect{|k,v| v[:family] == 'inet' }.first
  template '/etc/nginx/nginx.conf' do
    source "nginx.conf.erb"
    variables( server_list: result,
               nginx_server: ip)
  end

  service 'nginx' do
    action [:restart]
  end
end

action :detach do
  bash 'del' do
    code <<-EOH
      sed -i '/#{del_server}/d' /etc/nginx/nginx.conf
      EOH
  end
  service 'nginx' do
    action [:restart]
  end
end
