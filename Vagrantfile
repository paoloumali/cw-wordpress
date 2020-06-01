# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'json'
require 'yaml'

VAGRANTFILE_API_VERSION ||= "2"
confDir = $confDir ||= File.expand_path(File.dirname(__FILE__))

serverYamlPath = confDir + "/server.yaml"
serverJsonPath = confDir + "/server.json"
aliasesPath = confDir + "/server/bash_aliases"

if File.exist? serverYamlPath then
    settings = YAML::load(File.read(serverYamlPath))
elsif File.exist? serverJsonPath then
    settings = JSON::parse(File.read(serverJsonPath))
else
    abort "Server settings file not found in #{confDir}"
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "bento/debian-9"
  config.vm.network "private_network", ip: settings['ip']

  if File.exist? aliasesPath then
      config.vm.provision "file", source: aliasesPath, destination: "/tmp/bash_aliases"
      config.vm.provision "shell" do |s|
          s.inline = "awk '{ sub(\"\r$\", \"\"); print }' /tmp/bash_aliases > /home/vagrant/.bash_aliases && chown vagrant:vagrant /home/vagrant/.bash_aliases"
      end
  end

  config.vm.provider settings['provider'] do |vb|
    # free -m
    vb.memory = settings['memory']
    # lscpu
    vb.cpus = settings['cpus']
    # lspci -v -s 00:02.0
    # vb.customize = ["modifyvm", :id, "--vram", vram]
  end

  config.vm.provision "shell", path: "scripts/create-deployer.sh"

  #config.vm.synced_folder "./", "/home/paoloumali/sites/cloudways.paoloumali.com",
  #  mount_options: ["dmode=775,fmode=777"]

  config.vm.provision "shell", path: "scripts/php-setup.sh"
  config.vm.provision "shell", path: "scripts/nginx-setup.sh"
  config.vm.provision "shell", path: "scripts/mariadb-setup.sh"
  config.vm.provision "shell", path: "scripts/after.sh"

  # config.vm.synced_folder "./", "/home/paoloumali/sites/cloudways.paoloumali.com"
end

puts "-------------------------------------------------"
puts "Demo URL : http://#{settings['ip']}"
puts "-------------------------------------------------"
