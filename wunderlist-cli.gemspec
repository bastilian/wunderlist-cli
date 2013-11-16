# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "wunderlist-cli"
  spec.version       = "0.0.1"
  spec.authors       = ["Sebastian Gräßl"]
  spec.email         = ["sebastian@validcode.me"]
  spec.description   = "A Wunderlist command-line interface"
  spec.summary       = "A Wunderlist command-line interface"
  spec.homepage      = "https://github.com/bastilian/wunderlist-cli"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "thor"
  spec.add_dependency "fog-wunderlist"
end
