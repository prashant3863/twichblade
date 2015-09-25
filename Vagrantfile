#-*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
   config.vm.define :user1 do |user|
      user.vm.box = "ubuntu/trusty64"

      user.vm.box_check_update = false
      user.vm.network "private_network", ip: "10.1.1.22"
      user.vm.hostname = "user1"
      user.vm.synced_folder "./", "/home/vagrant/app"

      user.vm.provider "virtualbox" do |vb|
         vb.memory = "512"
      end

      user.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

      user.vm.provision "shell", privileged: false, inline: <<-SHELL
         echo "Updating system !!"
         sudo apt-get -y update
         echo "Installing package dependencies"
         sudo apt-get install -y git-core curl zlib1g-dev build-essential 
         sudo apt-get install -y libssl-dev libreadline-dev libyaml-dev 
         sudo apt-get install -y libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libpq-dev
         sudo apt-get install -y libcurl4-openssl-dev python-software-properties libffi-dev
         git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
         sudo locale-gen en_US en_US.UTF-8
         echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc    
         echo 'eval "$(rbenv init -)"' >> ~/.bashrc
         git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
         echo 'export LC_CTYPE=en_US.UTF-8' >> ~/.bashrc
         echo 'export LC_ALL=en_US.UTF-8' >> ~/.bashrc
         source ~/.bashrc    
         ~/.rbenv/bin/rbenv install 2.2.2
         ~/.rbenv/bin/rbenv global 2.2.2
         ~/.rbenv/bin/rbenv rehash
         ~/.rbenv/shims/gem install bundler
         cd ~/app
         ~/.rbenv/shims/bundle install
      SHELL
   end

   config.vm.define :db do |db|
      db.vm.box = "ubuntu/trusty64"
      db.vm.network :private_network, ip: "10.1.1.33"
      db.vm.hostname = "db"
      db.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
      db.vm.synced_folder "./", "/home/vagrant/app"

      db.vm.provision "shell", privileged: false, inline: <<-SHELL
         echo "Installing Postgresql"
         sudo apt-get install -y postgresql postgresql-client postgresql-contrib libpq-dev
         sudo -u postgres psql -f /home/vagrant/app/db_provision.sql
         echo "Setting up listen addresses"
         echo "listen_addresses = '*'" | sudo tee -a /etc/postgresql/9.3/main/postgresql.conf
         echo "host    all    all    10.1.1.1/24 password" | sudo tee -a /etc/postgresql/9.3/main/pg_hba.conf
         sudo service postgresql restart
      SHELL
   end
end
