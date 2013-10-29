#Babblings

Babblings is a place where you can share the content that you enjoy on the internet with others. Wait? Isn't that what Facebook, Twitter, Tumblr, Pinterest do? Sigh, yes - it is.

So why choose babblings? Well, because it's open source and because I'm cooler than all of those other services.

###What this application uses:
* Twitter bootstrap
* Paperclip
* Amazon S3

To get this application up and running, do the following:

```
git clone https://github.com/bswinnerton/babblings.git
cd babblings
brew install postgres # if you're on a mac
apt-get install postgres # if you're on a debian/ubuntu box
bundle install
rake db:migrate
rake db:seed
```
And sit in wonder of the amazement of your babblings.