require File.dirname(__FILE__) + '/init'
require 'sinatra'

#use Airbrake::Rack

get '/' do
  "Hello World"
end

get '/log' do
  if File.exist?("#{APP_ROOT}/log/#{ApplicationSettings.log_filename}")
    #send_file "#{APP_ROOT}/log/#{ApplicationSettings.log_filename}", :type => :text
    log_data = File.readlines("#{APP_ROOT}/log/#{ApplicationSettings.log_filename}").reverse.join
    
    content = "<pre>#{log_data}</pre>"
    
    halt 200, {'Content-Type' => 'text/plain'}, log_data
  end
end