web 'jboss or tomcat' do 
  action [:install, :setup, :restart]
  if node.role?('web_jboss')
    cookbook 'web_jboss'
  elsif node.role?('web_tomcat')
    cookbook 'web_tomcat'
  else
  	puts "please try jboss or tomcat role"
  end
end
