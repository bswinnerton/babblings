if ENV['CODECLIMATE_REPO_TOKEN']
  require 'codeclimate-test-reporter'

  CodeClimate::TestReporter.start do
    load_profile 'rails'
    add_filter 'vendor/'
    add_filter 'lib/core_importer/'
  end
end
