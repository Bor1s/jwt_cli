# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jwt_cli/version'

Gem::Specification.new do |spec|
  spec.name          = "jwt_cli"
  spec.version       = JwtCli::VERSION
  spec.authors       = ["Boris"]
  spec.email         = ["boris.bbk@gmail.com"]

  spec.summary       = %q{A CLI for generating Json Web Tokens}
  spec.description   = %q{A CLI for generating Json Web Tokens}
  spec.homepage      = "https://github.com/Bor1s/jwt_cli"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = "jwt_cli"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", '~> 0.10.3'

  spec.add_runtime_dependency     'thor', '~> 0.19.4'
  spec.add_runtime_dependency     'jwt', '~> 1.5', '>= 1.5.4'
  spec.add_runtime_dependency     'clipboard', '~> 1.1', '>= 1.1.1'
end
