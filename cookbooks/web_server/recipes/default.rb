package 'nginx' do
  action :install
end

service 'nginx' do
  action [ :enable, :start ]
end

web_server 'proxy_pass'


