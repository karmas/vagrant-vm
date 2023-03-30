# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-7.4"
  config.vm.hostname = 'vm'
  config.ssh.forward_x11 = true

  config.vm.network "forwarded_port", guest: 8080, host: 18080
  config.vm.network "forwarded_port", guest: 20000, host: 20000

  config.vm.provider "virtualbox" do |vb|
    #vb.gui = true
    vb.memory = "2048"
    vb.cpus = "2"
  end

  config.vm.provision "shell", path: 'centos-prov.sh'
  #config.vm.provision "shell", path: 'centos-xfce.sh'
end
