# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.define "twichblade-vm"
  config.vm.box = "ubuntu/trusty64"

  config.vm.box_check_update = false

  # config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.network "private_network", ip: "192.168.33.10"


  config.vm.synced_folder "./", "/app"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end
  
  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
  SHELL
  #  sudo apt-get install -y apache2
end
