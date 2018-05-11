# -*- mode: ruby -*-
# vi: set ft=ruby :

NODE_COUNT = 2

Vagrant.configure("2") do |config|
 config.vm.define "chef-server" do |subconfig|
    subconfig.vm.box = "centos-7.4-x86_64-minimal.box"
    subconfig.vm.hostname = "chef-server"
    subconfig.vm.network :private_network, ip: "192.168.20.12"
    config.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--memory", 2048]
        v.customize ["modifyvm", :id, "--cpus", 2]
    v.name="chef-server"
    end
 end
end

Vagrant.configure("2") do |config|
 config.vm.define "chef-node1" do |subconfig|
    subconfig.vm.box = "centos-7.4-x86_64-minimal.box"
    subconfig.vm.hostname = "chef-node1"
    subconfig.vm.network :private_network, ip: "192.168.10.11"
    config.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 2048]
      v.customize ["modifyvm", :id, "--cpus", 2]
    v.name="chef-node1"
    end
  end
end
