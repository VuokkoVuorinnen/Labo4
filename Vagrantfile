# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'centos-65-x86_64-puppetlabs'
  config.vm.box_url = 'http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box'
  
  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network :private_network, ip: '192.168.56.10'

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder 'www', '/var/www/html'
  config.vm.synced_folder 'bats/bin', '/home/vagrant/bin'
  config.vm.synced_folder 'bats/libexec', '/home/vagrant/libexec'
  config.vm.synced_folder 'bats/tests', '/home/vagrant/tests'

  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    vb.name = 'lampstack'
    vb.customize ['modifyvm', :id, '--cpus', 1 ]
    vb.customize ['modifyvm', :id, '--memory', 512 ]
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'manifests'
    puppet.manifest_file  = 'site.pp'
    puppet.module_path = 'modules'
  end
end
