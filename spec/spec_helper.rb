# This file is copied to ~/spec when you run 'ruby script/generate rspec'
# from the project root directory.
ENV["RAILS_ENV"] ||= 'test'
ENV['RAILS_ROOT'] ||= File.dirname(__FILE__) + '/../../../..'
require 'ruby-debug'

require File.expand_path(File.join(ENV['RAILS_ROOT'], 'config/environment'))

def load_schema
  config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))
  ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + '/debug.log')
  db_adapter = 'sqlite3'
  ActiveRecord::Base.establish_connection(config[db_adapter])
  load(File.dirname(__FILE__) + '/schema.rb')
  require File.dirname(__FILE__) + '/../init'
end

load_schema
require 'rspec/rails'
require 'support/models'
require 'support/blueprints'

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, comment the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true
end
