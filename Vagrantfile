Vagrant.configure("2") do |config|
    config.vm.hostname = "chef.techoism.local"  
    config.vm.define :main_day03 do |main_day03|
        main_day03.vm.provider :virtualbox do |v|
            v.name = "main_day03"
        end
        main_day03.vm.box = "bento/centos-7.3"
        main_day03.vm.network :private_network, ip: "192.168.10.11"
        main_day03.ssh.forward_agent = true
	end
end

