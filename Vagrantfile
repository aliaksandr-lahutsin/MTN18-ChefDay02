# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "sbeliakou/centos-7.4-x86_64-minimal"

    config.vm.define "chef-server" do |ms|
      ms.vm.hostname = 'chef-server'
      ms.vm.network :private_network, ip: "192.168.20.15"
      ms.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["modifyvm", :id, "--memory", 2048]
        v.customize ["modifyvm", :id, "--name", "chef-server"]
      end
    end

    config.vm.define "node-jboss".to_sym do |tc|
      tc.vm.host_name = "node-jboss"
      tc.vm.network "private_network", ip: ("192.168.10.12")
      tc.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["modifyvm", :id, "--memory", 2048]
        v.customize ["modifyvm", :id, "--name", "node-jboss"]
        end
    end

    config.vm.define "node-web".to_sym do |tc|
      tc.vm.host_name = "node-web"
      tc.vm.network "private_network", ip: ("192.168.10.11")
      tc.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["modifyvm", :id, "--memory", 1024]
        v.customize ["modifyvm", :id, "--name", "node-web"]
        end
    end
end


