namespace :db do
  break unless Rails.env.development?

  def capture_backup(environment)
    puts "Performing database backup of #{environment}"
    Bundler.with_clean_env { system("heroku pgbackups:capture --expire -r #{environment}") }
  end

  def pull_backup(environment)
    puts "Cloning #{environment} data locally"
    Bundler.with_clean_env { system("heroku pgbackups:pull -r #{environment}") }
  end

  namespace :production do
    desc 'Clone production data to local database'
    task clone_to_local: :environment do
      task ARGV.last.to_sym # Without this line, a blank '--' is required in the arguments
      capture_backup(:production)
      pull_backup(:production)
    end
  end
end
