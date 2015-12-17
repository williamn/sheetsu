# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sheetsu/version'

Gem::Specification.new do |spec|
  spec.name          = 'sheetsu'
  spec.version       = Sheetsu::VERSION
  spec.authors       = ['William Notowidagdo']
  spec.email         = ['wnotowidagdo@gmail.com']

  spec.summary       = 'Sheetsu API wrapper'
  spec.homepage      = 'https://github.com/williamn/sheetsu'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'httparty', '~> 0.13.7'
  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'webmock', '~> 1.22'
  spec.add_development_dependency 'rubocop', '~> 0.35.1'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.4.8'
end
