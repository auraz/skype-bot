require "./init"
require "./server"

use Rack::CommonLogger, Logger.new(APP_ROOT + '/log/rack.log')

ENV['RACK_ENV'] = APP_ENV || "production"
run Sinatra::Application