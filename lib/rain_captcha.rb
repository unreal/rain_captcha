require 'net/http'
require 'rain_captcha/configuration'

module RainCaptcha
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
      response = Net::HTTP.get_response(verify_uri(identifier, answer))
      if response.is_a? Net::HTTPSuccess
        response.body == "true"
      else
        response.value
      end
    end
  end
end
