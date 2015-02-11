Vagrant.configure(2) do |config|
  config.vm.box = 'trusty64'
  config.vm.box_url = 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
  end

  config.vm.synced_folder "salt-config/roots/", "/srv/"

  config.vm.provision :salt do |salt|
    salt.minion_config = "salt-config/minion"
    salt.run_highstate = true
  end
end
