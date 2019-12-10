# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.disksize.size = '24GB'

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 8081, host: 8081

  config.vm.synced_folder "shared-with-vm", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "4096"
    vb.cpus = "4"
  end

  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get -y update
    sudo add-apt-repository ppa:jonathonf/vim
    sudo apt-get -y update
    sudo apt-get install -y vim git
    sudo apt-get install -y build-essential
    sudo apt-get install -y sysstat htop
    sudo apt-get install -y linux-tools-common linux-tools-generic linux-tools-`uname -r`
  SHELL
end
