task :environment do 
  require "ap"
  require 'hirb'
  require 'irb/completion'
  require "wirble"
  
  Hirb.enable
end


desc 'Default: run application cosole'
task :console => :environment do
  require 'irb'
  ARGV.clear
  IRB.start
end