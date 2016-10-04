# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
     vb.gui = true
  
    # Customize the amount of memory on the VM:
    vb.memory = "4096"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
  config.vm.hostname = "josso-playground"

  # Build provisioning command, to start we add lxc-docker package
  pkg_cmd = "apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D; "
  pkg_cmd << "echo deb https://apt.dockerproject.org/repo ubuntu-trusty main > /etc/apt/sources.list.d/docker.list; "
  pkg_cmd << "apt-get update -qq; /usr/share/debconf/fix_db.pl; apt-get install -q -y --force-yes docker-engine=1.10.3-0~trusty; "

  # Add vagrant user to the docker group
  pkg_cmd << "usermod -a -G docker vagrant; "

  # Install GUI environment and browser
  pkg_cmd << "apt-get install -y -qq xfce4 firefox flashplugin-installer ; true; "
  pkg_cmd << "/usr/share/debconf/fix_db.pl; "
  pkg_cmd << "apt-get install -y -qq xfce4 firefox flashplugin-installer"

  # Build unpublished docker images
  play_cmd = "cd /home/vagrant; "
  play_cmd << "git clone https://github.com/atricore/atricore-josso-playground.git; "
  play_cmd << "git -C atricore-josso-playground/oracle-java8 pull origin master; "
  play_cmd << "docker build -t atricore/josso:oracle-java8 atricore-josso-playground/oracle-java8; "

  dns_cmd = "echo nameserver 172.17.0.1 > /etc/resolv.conf; " 

  config.vm.provision "infra", type: "shell" do |s|
    s.inline = pkg_cmd
  end

  config.vm.provision "docker" do |d|
    d.pull_images "crosbymichael/skydock"
    d.pull_images "crosbymichael/skydns"
    d.pull_images "atricore/josso:apache-tomcat8-tc1"
    d.pull_images "atricore/josso:apache-tomcat8-tc2"
  end

  config.vm.provision :shell, inline: play_cmd, run: "always"
  config.vm.provision :docker_compose, yml: "/home/vagrant/atricore-josso-playground/demo-josso-ce-2.4.2-javaee-tomcat/docker-compose.yml", project_name: "demo", run: "always"
  config.vm.provision :shell, inline: dns_cmd, run: "always"
end
