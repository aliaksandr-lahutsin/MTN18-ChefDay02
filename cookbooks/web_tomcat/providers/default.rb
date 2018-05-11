
# For Example

action :install do
  package 'httpd' do
    package_name 'httpd'
    action :install
  end
end

