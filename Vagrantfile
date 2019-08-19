Vagrant.configure("2") do |config|
  config.vm.box = "berchev/rails64"
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 6379, host: 6379
  config.vm.network :forwarded_port, guest: 9000, host: 9000 #portainer
  config.vm.provision :shell, path: "scripts/provision.sh"
end
