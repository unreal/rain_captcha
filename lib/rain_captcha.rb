require 'net/http'
require 'rain_captcha/configuration'

module RainCaptcha
  require 'rain_captcha/railtie' if defined?(Rails)

  extend Configuration

  class << self
    def url(identifier)
      uri = URI(endpoint)
      params = { key: identifier }
      uri.query = URI.encode_www_form(params)
      uri.to_s
    end

    def verify_url(identifier, answer)
      verify_uri(identifier, answer).to_s
    end

    def verify_uri(identifier, answer)
      uri = URI("#{endpoint}test/")
      params = { key: identifier, code: answer }
      uri.query = URI.encode_www_form(params)
      uri
    end

    def verify(identifier, answer)
      Net::HTTP.get(verify_uri(identifier, answer)) == "true"
    end
  end
end
