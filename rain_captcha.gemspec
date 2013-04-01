# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rain_captcha/version'

Gem::Specification.new do |spec|
  spec.name        = 'rain_captcha'
  spec.version     = RainCaptcha::VERSION
  spec.licenses    = ['MIT']
  spec.authors     = ['Jay Strybis']
  spec.email       = ['jay.strybis@gmail.com']
  spec.homepage    = 'https://github.com/unreal/rain_captcha'
  spec.summary     = %q{Simple Ruby wrapper for RainCaptcha service}
  spec.description = %q{Anti-spam protection for your website}

  spec.files = %w(LICENSE.md rain_captcha.gemspec Rakefile README.md)
  spec.files += Dir.glob("lib/**/*.rb")
  spec.test_files = Dir.glob("test/**/*")

  spec.require_paths = ['lib']
  spec.required_rubygems_version = '>= 1.3.6'

  spec.add_development_dependency 'bundler', '~> 1.0'
  spec.add_development_dependency 'test-unit', '~> 2.5'
  spec.add_development_dependency 'webmock', '~> 1.11'
end

