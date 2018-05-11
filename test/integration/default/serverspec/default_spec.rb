require 'serverspec'
set :backend, :exec


if node.role?('jboss_server')
  web_type = 'jboss'
elsif node.role?('tomcat_server')
  web_type = 'tomcat'
end

describe "package is installed" do
	it "#{web_type} are installed" do
		expect(package("#{web_type}")).to be_installed
	end
end

describe "service are running" do
	it "#{web_type} are running" do
		expect(service("#{web_type}")).to be_running
	end
end

describe "port are listened" do
	it "port are listened" do
		expect(port(8080)).to be_listening
	end
end