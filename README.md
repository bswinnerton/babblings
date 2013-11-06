#Babblings
[![Build Status](https://travis-ci.org/bswinnerton/babblings.png)](https://travis-ci.org/bswinnerton/babblings)
[![Coverage Status](https://coveralls.io/repos/bswinnerton/babblings/badge.png)](https://coveralls.io/r/bswinnerton/babblings)
[![Code Climate](https://codeclimate.com/github/bswinnerton/babblings.png)](https://codeclimate.com/github/bswinnerton/babblings)
[![Dependency Status](https://gemnasium.com/bswinnerton/babblings.png)](https://gemnasium.com/bswinnerton/babblings)

Babblings is a place where you can share the content that you enjoy on the internet with others. Wait? Isn't that what Facebook, Twitter, Tumblr, Pinterest do? Sigh, yes - it is.

So why choose babblings? Well, because it's open source and because I'm cooler than all of those other services.

###What this application uses:
* Twitter bootstrap
* Paperclip
* Amazon S3

###How to get the application started

```
git clone https://github.com/bswinnerton/babblings.git
cd babblings
brew install postgres # if you're on a mac
apt-get install postgres # if you're on a debian/ubuntu box
bundle install
rake db:migrate
rake db:seed # optional to see sample data
export BABBLINGS_SECRET_TOKEN=$(rake secret)
rails s
```
And sit in wonder of the amazement of your babblings.

### Configuring for Amazon S3
There are a few environment variables that you'll want to set if you plan on using this application in production on something like heroku. They are as follows:

```
BABBLINGS_AWS_ACCESS_KEY_ID
BABBLINGS_AWS_SECRET_ACCESS_KEY
BABBLINGS_S3_BUCKET
```

You'll want to get these variables from when you create your Amazon S3 bucket, detailed [here](https://devcenter.heroku.com/articles/s3).
