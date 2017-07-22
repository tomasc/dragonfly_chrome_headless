# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dragonfly_chrome_headless/version'

Gem::Specification.new do |spec|
  spec.name          = "dragonfly_chrome_headless"
  spec.version       = DragonflyChromeHeadless::VERSION
  spec.authors       = ["Tomáš Celizna"]
  spec.email         = ["mail@tomascelizna.com"]

  spec.summary       = %q{Uses Headless Chrome to generate PDF from HTML}
  spec.homepage      = "https://github.com/tomasc/dragonfly_chrome_headless"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'dragonfly', '~> 1.0'

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
