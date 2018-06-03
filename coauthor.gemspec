
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coauthor/version'

Gem::Specification.new do |spec|
  spec.name          = 'coauthor'
  spec.version       = Coauthor::VERSION
  spec.authors       = ['Andrew Vogel']
  spec.email         = ['andrewpvogel@gmail.com']

  spec.summary       = 'Easily setup Github Coauthoring'
  spec.description   = 'Command line tool to set up and use Github Coauthoring'
  spec.homepage      = 'https://github.com/avogel3/coauthor'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_runtime_dependency 'colorize'
  spec.add_runtime_dependency 'thor'
end
