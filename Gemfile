ruby '2.1.0'
source 'https://rubygems.org'

gem 'rails', '4.0.2'
gem 'sass-rails', '~> 4.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'

gem 'bootstrap-sass'
gem 'paperclip', '~> 3.0'

group :production do
  gem 'pg'
  gem 'unicorn'
  gem 'newrelic_rpm'
  gem 'rails_12factor'
  gem 'aws-sdk'
end

group :development, :test do
  gem 'sqlite3'
  gem 'pry'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman'
  gem 'awesome_print'
  gem 'guard'
  gem 'guard-rspec'
  gem 'terminal-notifier-guard'
end

group :test do
  gem 'simplecov', require: false
  gem 'coveralls', require: false
  gem 'launchy'
  gem 'capybara'
  gem 'selenium-webdriver'
  #gem 'poltergeist'
  gem 'database_cleaner', '< 1.1.0'
end

group :doc do
  gem 'sdoc', require: false
end
