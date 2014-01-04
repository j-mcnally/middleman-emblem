# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middleman-emblem/version'

Gem::Specification.new do |gem|
  gem.name          = "middleman-emblem"
  gem.version       = Middleman::Emblem::VERSION
  gem.authors       = ["j-mcnally"]
  gem.email         = ["justin@kohactive.com"]
  gem.description   = "Emblem support for middleman"
  gem.summary       = "Uses emblem butcher."
  gem.homepage      = "https://github.com/j-mcnally/middleman-emblem"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_runtime_dependency("barber-emblem", ">= 0.1.0")
  gem.add_runtime_dependency("emblem-source", ">= 0.3.0")
end
