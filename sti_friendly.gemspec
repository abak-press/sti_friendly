# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sti_friendly/version'

Gem::Specification.new do |spec|
  spec.name          = 'sti_friendly'
  spec.version       = StiFriendly::VERSION
  spec.authors       = ['Stanislav Gordanov']
  spec.email         = ['stanislav.gordanov@gmail.com']
  spec.description   = %q{Изменение класса у STI модели}
  spec.summary       = %q{Изменение класса у STI модели}
  spec.homepage      = 'https://github.com/abak-press/sti_friendly'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord'
  spec.add_dependency 'activesupport'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
