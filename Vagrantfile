Vagrant.configure("2") do |config|
    config.vm.hostname = "chef.techoism.local"  
    config.vm.define :main_day04 do |main_day04|
        main_day04.vm.provider :virtualbox do |v|
            v.name = "main_day04"
        end
        main_day04.vm.box = "bento/centos-7.3"
        main_day04.vm.network :private_network, ip: "192.168.10.12"
        main_day04.ssh.forward_agent = true
	end
end

