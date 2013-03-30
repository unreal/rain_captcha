require 'test_helper'

class Foo
  extend RainCaptcha::Configuration
end

class ConfigurationTest < Test::Unit::TestCase

  def setup
    Foo.reset
  end

  def test_default_endpoint
    assert_equal 'http://raincaptcha.driversworld.us/captcha/', Foo.endpoint
  end

  def test_configure_via_block
    Foo.configure do |c|
      c.endpoint = 'bar'
    end

    assert_equal 'bar', Foo.endpoint
  end

end
