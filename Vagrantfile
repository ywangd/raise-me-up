Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.synced_folder ".", "/tmp/raise-me-up"
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
  end

  config.vm.provision "shell", path: "scripts/bootstrap.sh", privileged: false, env: {
    "ANSIBLE_VERBOSITY" => ENV['ANSIBLE_VERBOSITY']
  }
end
