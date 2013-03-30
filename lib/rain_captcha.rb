require 'rain_captcha/configuration'

module RainCaptcha
  require 'rain_captcha/railtie' if defined?(Rails)

  extend Configuration
end
