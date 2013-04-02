APP_ROOT = "#{File.dirname(__FILE__)}" unless defined?(APP_ROOT)
APP_ENV = ENV['APP_ENV'] || ENV['RACK_ENV'] || "development"

begin
  require "rubygems"
  require "bundler/setup"
rescue LoadError
  raise "Could not load the bundler gem. Install it with `gem install bundler`."
end

# Initialize application settings
require "#{APP_ROOT}/lib/settings"

# Initialize logger
require "#{APP_ROOT}/lib/log"
LOGGER = Log.new.logger

# Enabling airbrake
#require 'airbrake'

# Airbrake.configure do |config|
#   config.api_key = ApplicationSettings.airbrake_key
# end

# Initialized Resque and redis
# require 'resque'
# Resque.redis = Redis.new(:host => RedisSettings.host, :port => RedisSettings.port)
