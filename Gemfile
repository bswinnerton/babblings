ruby '2.1.3'
source 'https://rubygems.org'

gem 'rails', '4.1.6'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'

gem 'unicorn'
gem 'pg'
gem 'pry-rails'
gem 'sidekiq'
gem 'sinatra', require: false
gem 'paperclip'
gem 'delayed_paperclip'
gem 'kaminari'
gem 'draper'
gem 'paranoia'

group :production, :staging do
  gem 'rails_12factor'
  gem 'rack-timeout'
  gem 'aws-sdk'
  gem 'raygun4ruby'
end

group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'awesome_print'
end

group :development do
  gem 'spring'
end

group :test do
  gem 'capybara'
  gem 'poltergeist'
  gem 'shoulda-matchers'
  gem 'faker'
  gem 'database_cleaner'
  gem 'simplecov', '0.7.1' # Any higher version causes rspec exit status to return 0
  gem 'codeclimate-test-reporter', require: false
end

group :doc do
  gem 'sdoc', '~> 0.4.0'
end
