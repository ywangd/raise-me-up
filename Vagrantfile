unless Vagrant.has_plugin?("vagrant-disksize")
  puts 'Installing vagrant-disksize Plugin...'
  system('vagrant plugin install vagrant-disksize')
end

Vagrant.configure("2") do |config|
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
    "ANSIBLE_VAULT_PASSWORD" => ENV['ANSIBLE_VAULT_PASSWORD']
  }
end
