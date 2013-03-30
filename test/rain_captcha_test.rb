require 'test_helper'
require 'webmock/test_unit'

class RainCaptchaTest < Test::Unit::TestCase

  def test_url
    assert_equal "http://raincaptcha.driversworld.us/captcha/?key=example_org%3A127.0.0.1", RainCaptcha.url("example_org:127.0.0.1")
    assert_equal "http://raincaptcha.driversworld.us/captcha/?key=username%40example.org", RainCaptcha.url("username@example.org")
  end

  def test_verify_url
    assert_equal "http://raincaptcha.driversworld.us/captcha/test/?key=example_org%3A127.0.0.1&code=abcde", RainCaptcha.verify_url("example_org:127.0.0.1","abcde")
    assert_equal "http://raincaptcha.driversworld.us/captcha/test/?key=username%40example.org&code=fghij", RainCaptcha.verify_url("username@example.org","fghij")
  end

  def test_verify_uri_returns_a_uri
    assert RainCaptcha.verify_uri("foo","bar").is_a? URI
  end

  def test_verify_true
    stub_request(:get, "http://raincaptcha.driversworld.us/captcha/test/?code=bar&key=foo").
      to_return(:status => 200, :body => "true")
    assert RainCaptcha.verify("foo","bar")
  end

  def test_verify_false
    stub_request(:get, "http://raincaptcha.driversworld.us/captcha/test/?code=bar&key=foo").
      to_return(:status => 200, :body => "false")
    assert !RainCaptcha.verify("foo","bar")
  end

  def test_verify_unsuccesful
    stub_request(:get, "http://raincaptcha.driversworld.us/captcha/test/?code=bar&key=foo").
      to_return(:status => 500)

    assert_raise Net::HTTPFatalError do
      RainCaptcha.verify("foo","bar")
    end
  end

end
