module RainCaptcha
  module Configuration
    attr_accessor :endpoint

    DEFAULT_ENDPOINT = 'http://raincaptcha.driversworld.us/captcha/'

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def reset
      self.endpoint = DEFAULT_ENDPOINT
    end
  end
end
