# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

%w{RAX_USERNAME RAX_API_KEY VAGRANT_ADMIN_PASSWORD}.each do |var|
  abort "Please set the environment variable #{var} in order to run the test" unless ENV.key? var
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "dummy"

  config.vm.define :ubuntu do |ubuntu|
    ubuntu.ssh.private_key_path = '~/.ssh/id_rsa'
    ubuntu.vm.provider :rackspace do |rs|
      rs.username = ENV['RAX_USERNAME']
      rs.admin_password = ENV['VAGRANT_ADMIN_PASSWORD']
      rs.api_key  = ENV['RAX_API_KEY']
      rs.flavor   = /512MB Standard Instance/
      rs.image    = /Ubuntu 14.10/
      rs.rackspace_region = :dfw
      rs.public_key_path = '~/.ssh/id_rsa.pub'
    end
    ubuntu.vm.provision "shell", path: "get_puppet.sh"
    ubuntu.vm.provision "puppet" do |puppet|
      puppet.module_path = 'modules'
      puppet.temp_dir = '/tmp/vagrant-puppet-2'
    end
  end
end
