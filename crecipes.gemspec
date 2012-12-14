require File.expand_path('../lib/crecipes/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Bobur Umerkulov"]
  gem.email         = ["b.umerkulov@gmail.com"]
  gem.description   = %q{Capistrano recipes}
  gem.summary       = %q{Capistrano recipes}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "crecipes"
  gem.require_paths = ["lib"]
  gem.version       = Crecipes::VERSION

  gem.add_runtime_dependency "capistrano"
  gem.add_runtime_dependency "resque"
  gem.add_runtime_dependency "resque-scheduler"
  
  gem.add_dependency "capistrano"
  gem.add_dependency "capistrano-resque", '0.0.9'
end
