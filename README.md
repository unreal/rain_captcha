# RainCaptcha

A simple Ruby wrapper for the [RainCaptcha](http://raincaptcha.driversworld.us/) HTTP API.

## Installation
    gem install rain_captcha

## Configuration
### Use HTTPS
```ruby
RainCaptcha.configure do |config|
  config.use_ssl = true
end

RainCaptcha.url("unique_identifier")
=> "https://raincaptcha.driversworld.us/captcha/?key=unique_identifier"
```

## Examples
### Get a Captcha image url
```ruby
RainCaptcha.url("unique_identifier")
=> "http://raincaptcha.driversworld.us/captcha/?key=unique_identifier"
```

### Verify a user response
```ruby
RainCaptcha.verify("unique_identifier", "correct_response")
=> true

RainCaptcha.verify("unique_identifier", "incorrect_response")
=> false
```

### RainCaptcha service not available
```ruby
RainCaptcha.verify("unique_identifier", "correct_response")
=> Net::HTTPFatalError
```
## Copyright
Copyright (c) 2013 Jay Strybis.
See [LICENSE][] for details.

[license]: LICENSE.md
