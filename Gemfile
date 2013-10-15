source 'https://rubygems.org'

gem 'rails', '4.0.0'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass', branch: '3'
gem 'paperclip', '~> 3.0'

group :production do
  gem 'pg'
  gem 'unicorn'
  gem 'newrelic_rpm'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'sqlite3'
end

group :development do
  gem 'pry'
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman'
  gem 'awesome_print'
  gem 'guard'
  gem 'guard-rspec'
  gem 'terminal-notifier-guard'
end

group :test do
  gem 'simplecov', :require => false
  gem 'launchy'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'selenium-webdriver'
  #gem 'poltergeist'
  gem 'database_cleaner', '< 1.1.0'
end

group :doc do
  gem 'sdoc', require: false
end
