# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rain_captcha/version'

Gem::Specification.new do |spec|
  spec.add_development_dependency 'bundler', '~> 1.0'
  spec.authors = ["Jay Strybis"]
  spec.description = %q{Anti-spam protection for your website}
  spec.email = ['jay.strybis@gmail.com']
  spec.files = %w(LICENSE.md rain_captcha.gemspec Rakefile README.md)
  spec.files += Dir.glob("lib/**/*.rb")
  spec.homepage = 'https://github.com/unreal/rain_captcha'
  spec.licenses = ['MIT']
  spec.name = 'rain_captcha'
  spec.require_paths = ['lib']
  spec.required_rubygems_version = '>= 1.3.6'
  spec.summary = spec.description
  spec.test_files = Dir.glob("test/**/*")
  spec.version = RainCaptcha::VERSION
end

