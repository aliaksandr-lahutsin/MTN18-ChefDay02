$ip="192.168.10.10"
$cookbook_dir="~/chef/task7/cookbooks"
Vagrant.configure(2) do |config|

    config.vm.define "vm" do |vm_config|
    vm7_config.vm.box = "bento/centos-7.3"
    vm7_config.vm.network "private_network", ip: $ip
    vm7_config.vm.hostname = "chef_day_2"
    vm7_config.vm.provider "virtualbox" do |v|
        v.name = "vm"
        v.customize ["modifyvm", :id, "--memory", 2048] 
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
    config.vm.provision "chef_solo" do |chef|
      chef.cookbooks_path = $cookbook_dir
      chef.add_recipe "java::default"
      chef.add_recipe "jboss::default"
    end
  end
end
