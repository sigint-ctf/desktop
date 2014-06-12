# -*- mode: ruby -*-
# vi: set ft=ruby :

box    = 'debian-7.5-desktop'
url    = ''
cksum  = '5b8f187e3134f31632541ec4f37d5bb10527992f164cfe0b03dfd6019a56afe7'
cktype = 'sha256'
name   = 'debian-7.5'

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define name, primary: true do |problem|
    # Every Vagrant virtual environment requires a box to build off of.
    problem.vm.box = box
    problem.vm.box_url = url
    problem.vm.box_download_checksum = cksum
    problem.vm.box_download_checksum_type = cktype

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    # problem.vm.synced_folder "../data", "/vagrant_data"
    #problem.vm.synced_folder ".", "/vagrant", disabled: true

    # Provision using a shell script
    problem.vm.provision :shell, path: "setup.sh"

    # Provider-specific problemuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    # Example for VirtualBox:
    problem.vm.provider :virtualbox do |vb|
        vb.gui = true
        vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
     end
  end
end
