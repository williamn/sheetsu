Gem::Specification.new do |spec|
  spec.name = 'sheetsu'
  spec.version = '0.1.0'
  spec.license = 'MIT'
  spec.summary = 'Sheetsu API wrapper'
  spec.platform = Gem::Platform::RUBY
  spec.author = 'William Notowidagdo'
  spec.files = ['lib/sheetsu.rb']
  spec.require_paths = 'lib'
  spec.add_runtime_dependency 'httparty', '~> 0.13.7'
  spec.add_development_dependency 'rspec', '~> 3.4'
  spec.add_development_dependency 'webmock', '~> 1.22'
end