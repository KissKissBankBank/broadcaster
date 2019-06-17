lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'broadcaster/version'

Gem::Specification.new do |spec|
  spec.name          = 'broadcaster'
  spec.version       = Broadcaster::VERSION
  spec.authors       = ['William Pollet']
  spec.email         = ['william.pollet@kisskissbankbank.com']
  spec.summary       = 'manage your publisher / subscriber relationshups'
  spec.homepage      = 'https://www.github.com/kisskissbankbank/broadcaster'
  spec.license       = 'MIT'

  spec.metadata['allowed_push_host'] = 'https://gemfury.com/'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem
  # that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`
      .split("\x0")
      .reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # This is a Rails engine, so, yeah
  spec.add_dependency 'rails', '>= 3.2', '< 5.1'

  # Code quality checker
  spec.add_development_dependency 'fashion_police', '~> 2.0.1'

  # linter
  spec.add_development_dependency 'rubocop', '~> 0.60'

  # coverage
  spec.add_development_dependency 'simplecov', '~> 0.16.1'

  # Code review automation
  spec.add_development_dependency 'pronto', '~> 0.10.0'

  # Rubocop Adapter for pronto
  spec.add_development_dependency 'pronto-rubocop', '~> 0.10.0'

  spec.add_development_dependency 'safe_pusher', '~> 0.2.2'

  # Debugger
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-byebug'

  # Specs
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'test-unit' # required for ruby > 2.1

  # Spec factories
  spec.add_development_dependency 'factory_bot_rails', '~> 5.0.2'

  # Dummy app database
  spec.add_development_dependency 'pg'

  # Gem hosting
  spec.add_development_dependency 'gemfury'
end
