Vagrant.configure("2") do |config|  
    config.vm.define :main2 do |main2|
        main2.vm.provider :virtualbox do |v|
            v.name = "main2234523452"
        end

        main2.vm.box = "bento/centos-7.3"
        main2.vm.network :private_network, ip: "192.168.10.10"
        main2.ssh.forward_agent = true
	end
end
