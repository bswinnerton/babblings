# MySQL.  Versions 4.1 and 5.0 are recommended.
# 
# Install the MYSQL driver
#   gem install mysql2
#
# Ensure the MySQL gem is defined in your Gemfile
#   gem 'mysql2'
#
# And be sure to use new-style password hashing:
#   http://dev.mysql.com/doc/refman/5.0/en/old-client.html
development:
  adapter: sqlite3
  database: db/babblings_development.sqlite3
  pool: 5

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  adapter: sqlite3
  database: db/babblings_test.sqlite3
  pool: 5

production:
  adapter: mysql2
  encoding: utf8
  reconnect: false
  database: babblings
  pool: 5
  username: root
  password:
  host: localhost
