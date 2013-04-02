require "settingslogic"

class ApplicationSettings < Settingslogic
  source "#{APP_ROOT}/config/application.yml"
  namespace APP_ENV
  load!
end