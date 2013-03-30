module RainCaptcha
  module Configuration
    attr_accessor :use_ssl

    RAINCAPTCHA_URL = 'raincaptcha.driversworld.us/captcha/'

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def protocol
      self.use_ssl ? "https" : "http"
    end

    def endpoint
      "#{self.protocol}://#{RAINCAPTCHA_URL}"
    end

    def reset
      self.use_ssl = false
    end
  end
end
