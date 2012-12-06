# Ubuntu 12.04.1 EC2 t1.micro Install
--------

Login to server
--------
    ssh ubuntu@<server>

Configure Server
--------
    sed -i "s/#force_color_prompt=yes/force_color_prompt=yes/g" ~/.bashrc && source ~/.bashrc
    sudo vi /etc/hosts    #<ip> <fqdn> <hostname>
    sudo vi /etc/hostname    #<hostname>
    sudo /etc/init.d/hostname restart

Configure swap for t1.micro
--------
    sudo dd if=/dev/zero of=/swap bs=1M count=1024
    sudo mkswap /swap
    sudo swapon /swap
    echo -e "/swap\tswap\tswap\tdefaults\t0\t0" | sudo tee -a /etc/fstab
    swapon -s

Create new local administrator account
--------
    sudo adduser <username>
    sudo -u <username> mkdir /home/<username>/.ssh/
    sudo cp .ssh/authorized_keys /home/<username>/.ssh/
    sudo chown <username>:<username> /home/<username>/.ssh/authorized_keys
    sudo adduser albert admin

Install updates
--------
    sudo apt-get update && sudo apt-get -y dist-upgrade
    if [ -f /var/run/reboot-required ]; then sudo shutdown -r now; fi

Login to server, customize shell
--------
    ssh <username>@<server>
    sed -i "s/#force_color_prompt=yes/force_color_prompt=yes/g" ~/.bashrc && source ~/.bashrc



# babblin.gs Install
--------

Get rails
--------
    wget --no-check-certificate https://raw.github.com/joshfng/railsready/master/railsready.sh && bash railsready.sh
    echo -e "source ~/.bashrc" | tee -a ~/.bash_profile && source ~/.bash_profile
    rvm install ruby-1.9.3-p327 #hopefully to be fixed
    sudo apt-get install nodejs

Clone application
--------
    sudo mkdir -p /var/www/babblin.gs/
    sudo chown <username>:<username> /var/www/babblin.gs/
    cd /var/www/babblin.gs/
    git clone https://github.com/bswinnerton/babblings-ruby.git .

Configure application
--------
    cp config/database.yml.inc config/database.yml
    bundle install
    rvmsudo rake db:migrate #if first run

Optional passenger install (`rvmsudo rails s -p 80` otherwise)
--------
    sudo apt-get install apache2-mpm-prefork apache2-prefork-dev libapr1-dev libaprutil1-dev
    /home/<username>/.rvm/gems/ruby-1.9.3-p327/gems/passenger-3.0.18/bin/passenger-install-apache2-module
    cd /etc/apache2/mods-available/
    sudo vi passenger.load
    sudo ln -s /etc/apache2/mods-available/passenger.load /etc/apache2/mods-enabled/passenger.load
    sudo a2enmod
    sudo vi /etc/apache2/sites-available/babblin.gs.vhost
    sudo ln -s /etc/apache2/sites-available/babblin.gs.vhost /etc/apache2/sites-enabled/babblin.gs.vhost
    sudo rm /etc/apache2/sites-enabled/000-default
    sudo service apache2 restart
