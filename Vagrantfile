Vagrant.configure("2") do |config|
  config.vagrant.plugins = ['vagrant-disksize']

  config.vm.box = "ubuntu/bionic64"
  config.disksize.size = '20GB'
  config.vm.synced_folder ".", "/home/vagrant/projects/raise-me-up"

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
  end

  config.vm.provision "shell", path: "scripts/vagrantup.sh", privileged: false, env: {
    "SKIP_INIT" => ENV['SKIP_INIT'],
    "ANSIBLE_VERBOSITY" => ENV['ANSIBLE_VERBOSITY'],
  }
end
