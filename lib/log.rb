require "logger"
require 'fileutils'

class ::Logger; alias_method :write, :<<; end

class Log
  attr_reader :logger, :level, :location

  def initialize
    @location = set_location()
    @level = set_level()
    @logger = Logger.new(@location, "daily")
    @logger.level = @level
  end

  def set_level(level_name = nil)
    level_name = level || ApplicationSettings.log_level
    if ["DEBUG", "INFO", "WARN", "ERROR", "FATAL"].include?(level_name.upcase)
      @level = eval "Logger::#{level_name.upcase}"
    else
      raise "#{level_name} logging level is not allowed"
    end
  end

  def set_location(location = nil)
    if location
      @location = location
    else
      FileUtils.mkdir_p "#{APP_ROOT}/log"
      @location = "#{APP_ROOT}/log/#{ApplicationSettings.log_filename}"
    end
  end

end
