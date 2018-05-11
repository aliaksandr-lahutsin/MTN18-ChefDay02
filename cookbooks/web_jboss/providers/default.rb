

#For Example

action :install do
  package 'nginx' do
    package_name 'nginx'
    action :install
  end
end

