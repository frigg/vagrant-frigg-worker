Vagrant.configure(2) do |config|
  config.vm.box = 'trusty64'
  config.vm.box_url = 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.synced_folder "salt-config/roots/", "/srv/"

  config.vm.provision :salt do |salt|
    salt.minion_config = "salt-config/minion"
    salt.run_highstate = true
  end

  if ENV['NUMBER_OF_WORKERS']
    number_of_workers = Integer(ENV['NUMBER_OF_WORKERS'])
  else
    number_of_workers = 1
  end

  for i in 1..number_of_workers
    config.vm.define "worker#{i}" do |worker|
    end
  end
end
