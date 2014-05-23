Vagrant.configure("2") do |config|
  config.vm.box = "base"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network "private_network", ip: "192.168.56.111"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 1080, host: 2080
  config.vm.synced_folder "./", "/var/www", id: "vagrant-root", :nfs => false
  
  config.vm.usable_port_range = (2200..2250)
  config.vm.provider :virtualbox do |virtualbox|
    virtualbox.customize ["modifyvm", :id, "--name", "mailcatcher-dev-vm"]
    virtualbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    virtualbox.customize ["modifyvm", :id, "--memory", "512"]
    virtualbox.customize ["setextradata", :id, "--VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end

  config.vm.provision :shell, :path => "provision.sh"

  config.ssh.username = "vagrant"
  config.ssh.shell = "bash -l"
  config.ssh.keep_alive = true
  config.ssh.forward_agent = false
  config.ssh.forward_x11 = false
  config.vagrant.host = :detect
end

