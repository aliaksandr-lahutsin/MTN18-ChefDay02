require 'spec_helper'

describe 'web_server::default' do
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.4.1708')
    runner.converge(described_recipe)
  end

  it 'Converges successfully' do
    expect { chef_run }.to_not raise_error
  end

  it 'Install nginx' do
    expect(chef_run).to install_package 'nginx'
  end

  it 'Ensure that nginx started' do
    expect(chef_run).to start_service('nginx')
  end

  it 'Ensure that web_server attach' do
    expect(chef_run).to attach_web_server 'proxy_pass'
  end

  it 'Ensure that web_server attach' do
    expect(chef_run).to_not detach_web_server 'proxy_pass'
  end

end
