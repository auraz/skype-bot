require File.expand_path(File.dirname(__FILE__) + '/init')
require 'rake'
#require 'rake/testtask'
#require 'rdoc/task'

Dir["#{File.dirname(__FILE__)}/lib/tasks/**/*.rake"].sort.each { |ext| load ext }

task :default => [:sayhello]

task :sayhello do
  p "Hello"
end