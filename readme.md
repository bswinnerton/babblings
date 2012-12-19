# babblings
---------

### Introduction ###

babblings is a tumblr-like platform that can incorporate various types of media in a masonry format. Acceptable content is:

1. Image (ending in .jpg, .png, .gif, etc):

        http://farm7.staticflickr.com/6119/6278651452_15a629cbe7.jpg

2. Youtube

        http://www.youtube.com/watch?v=yRvJylbSg7o&feature=g-all-lik

3. Vimeo:

        http://vimeo.com/6671508

4. Spotify URI:

        spotify:track:5xioIP2HexKl3QsI8JDlG8

5. Text:

        ಠ_ಠ

### Direction ###

babblings is designed to be a "relational content engine". It will be able to analyze the content that is being submitted and show related content based on the subject matter.

### Help ###

Please feel free to direct any questions or comments to the [issue tracker], located on GitHub. Installation instructions can be found below.

  [issue tracker]: https://github.com/bswinnerton/babblings/issues


Ubuntu 12.04.1 EC2 t1.micro Install
--------

### Login to server ###
    ssh ubuntu@<server>

### Configure Server ###
    sed -i "s/#force_color_prompt=yes/force_color_prompt=yes/g" ~/.bashrc && source ~/.bashrc
    sudo vi /etc/hosts    #<ip> <fqdn> <hostname>
    sudo vi /etc/hostname    #<hostname>
    sudo /etc/init.d/hostname restart

### Configure swap for t1.micro ###
    sudo dd if=/dev/zero of=/swap bs=1M count=1024
    sudo mkswap /swap
    sudo swapon /swap
    echo -e "/swap\tswap\tswap\tdefaults\t0\t0" | sudo tee -a /etc/fstab
    swapon -s

### Create new local administrator account ###
    sudo adduser <username>
    sudo -u <username> mkdir /home/<username>/.ssh/
    sudo cp .ssh/authorized_keys /home/<username>/.ssh/
    sudo chown <username>:<username> /home/<username>/.ssh/authorized_keys
    sudo adduser albert admin

### Install updates ###
    sudo apt-get update && sudo apt-get -y dist-upgrade
    if [ -f /var/run/reboot-required ]; then sudo shutdown -r now; fi

### Login to server, customize shell ###
    ssh <username>@<server>
    sed -i "s/#force_color_prompt=yes/force_color_prompt=yes/g" ~/.bashrc && source ~/.bashrc



babblings Install
--------

### Get rails ###
    wget --no-check-certificate https://raw.github.com/joshfng/railsready/master/railsready.sh && bash railsready.sh
    echo -e "source ~/.bashrc" | tee -a ~/.bash_profile && source ~/.bash_profile
    rvm install ruby-1.9.3-p327 #hopefully to be fixed: https://github.com/joshfng/railsready/issues/28#issuecomment-11102427
    sudo apt-get install nodejs

### Clone application ###
    sudo mkdir -p /var/www/babblin.gs/
    sudo chown <username>:<username> /var/www/babblin.gs/
    cd /var/www/babblin.gs/
    git clone https://github.com/bswinnerton/babblings.git .

### Configure application ###
    cp config/database.yml.inc config/database.yml
    bundle install
    rvmsudo rake db:setup #if first run

### Optional passenger install (`rvmsudo rails s -p 80` otherwise) ###
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

### Optional heroku install ###
    wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
    heroku login
    heroku git:remote -a <remote_name>

    heroku config:add DATABASE_URL="mysql2://<username>:<password>@<host>/<database>"
    heroku config:add AWS_ACCESS_KEY_ID="<AWS_ACCESS_KEY>"
    heroku config:add AWS_SECRET_ACCESS_KEY="<AWS_SECRET_ACCESS_KEY>"
    heroku config add AWS_BUCKET="<S3_BUCKET_NAME>"
    heroku config:add S3_HOST_ALIAS="<S3_DNS_CNAME>"

    git push heroku master
    heroku ps:scale web=1

========
[More Info][mi]
[mi]: https://devcenter.heroku.com/articles/rails3
