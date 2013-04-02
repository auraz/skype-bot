require File.dirname(__FILE__) + '/init'
require 'sinatra'
require 'json'

#use Airbrake::Rack

get '/' do
  "Hello World"
end

# Method for getting list of messages
# By default it provides JSON output
# Possible GET params are:
# => limit: (int) limit of messages to show
# => updated_after:(int) show only messages updated after specific date (timestamp)
# => created_after:(int) show only messages created after specific date (timestamp)
# By default it'll show just N (let's say 100) last messages
get '/messages.?:format?' do
  params = request.env['rack.request.query_hash']
  content_type :json
  
  limit = 10
  messages = []
  
  for i in 0..limit-1
     messages.push({
       :id => "supermegaid#{i}",
       :author => "a.lockshyn",
       :body => "Oh my god, this is a new #{i}th message",
       :created_at => Time.now.to_i,
       :updated_at => Time.now.to_i
    })
  end  

  messages.to_json
end

get '/log' do
  if File.exist?("#{APP_ROOT}/log/#{ApplicationSettings.log_filename}")
    #send_file "#{APP_ROOT}/log/#{ApplicationSettings.log_filename}", :type => :text
    log_data = File.readlines("#{APP_ROOT}/log/#{ApplicationSettings.log_filename}").reverse.join
    
    content = "<pre>#{log_data}</pre>"
    
    halt 200, {'Content-Type' => 'text/plain'}, log_data
  end
end