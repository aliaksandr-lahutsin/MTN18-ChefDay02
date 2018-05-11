# Cookbook Name:: web
# Recipe:: default

web 'jboss or tomcat' do 
  action [:install, :setup, :restart]
  if node.role?('web_jboss')
    provider 'web_jboss'
  elsif node.role?('web_tomcat')
    provider 'web_tomcat'
  else
  	puts "please try jboss or tomcat role"
  end
end
