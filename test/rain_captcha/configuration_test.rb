require 'test_helper'

class Foo
  extend RainCaptcha::Configuration
end

class ConfigurationTest < Test::Unit::TestCase

  def setup
    Foo.reset
  end

  def test_protocol
    assert_equal "http", Foo.protocol
  end

  def test_protocol_while_using_ssl
    Foo.use_ssl = true
    assert_equal "https", Foo.protocol
  end

  def test_endpoint
    assert_equal 'http://raincaptcha.driversworld.us/captcha/', Foo.endpoint
  end

  def test_configure_user_ssl
    Foo.configure do |c|
      c.use_ssl = true
    end

    assert_equal 'https://raincaptcha.driversworld.us/captcha/', Foo.endpoint
  end

end
