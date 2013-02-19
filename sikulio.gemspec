# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sikulio/version'

Gem::Specification.new do |gem|
  gem.name          = "sikulio"
  gem.version       = Sikulio::VERSION
  gem.authors       = ["Matthew Hull"]
  gem.email         = ["hull.matt@gmail.com"]
  gem.description   = %q{A Page Object style framework leveraging Sikuli}
  gem.summary       = %q{Test automation framework for all the things}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
