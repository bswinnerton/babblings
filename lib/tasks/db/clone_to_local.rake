namespace :db do
  break unless Rails.env.development?

  namespace :production do
    desc 'Clone production data to local database'
    task clone_to_local: :environment do
      task ARGV.last.to_sym # Without this line, a blank '--' is required in the arguments

      database_config = Rails.configuration.database_configuration.fetch(Rails.env)
      dump_file = "latest.dump".freeze

      puts "Performing database backup of production"
      Bundler.with_clean_env { system("heroku pg:backups capture -r production") }

      puts "Cloning production data locally"
      Bundler.with_clean_env { system("curl -o #{dump_file} `heroku pg:backups public-url -r production`") }

      puts "Dumping production data into local database"
      system("pg_restore --verbose --clean --no-acl --no-owner -h localhost -d #{database_config.fetch('database')} #{dump_file}")

      puts "Cleaning up"
      system("rm #{dump_file}")
    end
  end
end
