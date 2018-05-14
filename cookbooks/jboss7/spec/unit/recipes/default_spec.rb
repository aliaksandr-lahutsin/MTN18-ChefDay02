require 'chefspec'
require 'chefspec/berkshelf'

describe 'jboss7::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'centos', version: '7.4.1708') do |node|
      node.override['jboss7']['public_bind_addr'] = '192.168.10.12'
    end.converge(described_recipe)
  end

  before do
    stub_data_bag_item("jboss7", "http").and_return("id": "http", "http_port": "8085")
  end

  it 'Converges successfully' do
    expect { chef_run }.to_not raise_error
  end

  it 'Create a template "standalone.xml" with attributes' do
    expect(chef_run).to create_template('/opt/jboss/standalone/configuration/standalone.xml').with(
      source: 'standalone_xml.erb',
      user: 'jboss',
      group: 'jboss',
      mode: '0644',
    )
  end

  it 'Creates a template "jboss7-init" with attributes' do
    expect(chef_run).to create_template('/etc/init.d/jboss7').with(
      source: 'jboss7-init.erb',
      owner: 'root',
      group: 'root',
    )
  end
  
  it 'Creates user' do
    expect(chef_run).to create_user('jboss')
  end

end
