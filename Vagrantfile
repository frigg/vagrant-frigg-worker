Vagrant.configure(2) do |config|
  config.vm.box = 'precise32'
  config.vm.box_url = 'http://files.vagrantup.com/precise32.box'

  config.vm.synced_folder "salt-config/roots/", "/srv/"

  config.vm.provision :salt do |salt|
    salt.minion_config = "salt-config/minion"
    salt.run_highstate = true
  end
end
