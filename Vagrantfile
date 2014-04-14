# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  #config.vm.hostname = "rkhunter-berkshelf"

  config.omnibus.chef_version = :latest

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "squeeze64"
  config.vm.box_url = "https://s3.amazonaws.com/wa.milton.aws.bucket01/sqeeze.box"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  config.vm.network :private_network, ip: "10.33.33.94"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.

  # config.vm.network :public_network

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  #
  # View the documentation for the provider you're using for more
  # information on available options.
  config.vm.boot_timeout = 120
  #config.ssh.max_tries = 40
  #config.ssh.timeout   = 120

  # The path to the Berksfile to use with Vagrant Berkshelf
  config.berkshelf.berksfile_path = "./Berksfile"

  # Enabling the Berkshelf plugin. To enable this globally, add this configuration
  # option to your ~/.vagrant.d/Vagrantfile file
  config.berkshelf.enabled = true

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to exclusively install and copy to Vagrant's shelf.
  # config.berkshelf.only = []

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to skip installing and copying to Vagrant's shelf.
  # config.berkshelf.except = []
  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :rsyslog => {
        :server => "true",
        :log_dir => "/srv/logs",
        :preserve_fqdn => "on",
        :high_precision_timestamps => "on",
        :server_search => "role:rsyslog-server",
        :per_host_dir => "%HOSTNAME%",
        :logs_to_forward => "*",
        :papertrail_dest => "logs.papertrailapp.com:11111"
      },
      :rbenv => {
        :global => '1.9.3-p327',
        :rubies => ['1.9.3-p327'],
      }
    }

    chef.run_list = [
        "recipe[ruby_build]",
        "recipe[rbenv]",
        "recipe[rbenv::system]",
        "recipe[rbenv::vagrant]",
        "recipe[rsyslog-cookbook::default]",
        "recipe[rsyslog-cookbook::server]",
        "recipe[rsyslog-cookbook::client]",
        "recipe[rsyslog-cookbook::papertrail]"
    ]
  end
end
