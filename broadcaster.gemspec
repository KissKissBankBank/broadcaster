lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'broadcaster/version'

Gem::Specification.new do |spec|
  spec.name          = 'broadcaster'
  spec.version       = Broadcaster::VERSION
  spec.authors       = ['William Pollet']
  spec.email         = ['william.pollet@kisskissbankbank.com']
  spec.summary       = 'manage your publisher / subscriber relationships'
  spec.homepage      = 'https://www.github.com/kisskissbankbank/broadcaster'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org/'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

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
  spec.add_development_dependency 'rails', '~> 3.2'

  # Encapsulate business logic.
  spec.add_dependency 'interactor-rails'

  # GraphQL API
  spec.add_dependency 'graphql', '<= 1.9.19'

  # Miscellaneous utility code
  spec.add_dependency 'tote_bag', '>= 1.4'


  # coverage
  spec.add_development_dependency 'simplecov'

  # Code quality checker
  spec.add_development_dependency 'fashion_police', '>= 2.4.3'

  # Code review automation
  spec.add_development_dependency 'pronto'

  # Rubocop Adapter for pronto
  spec.add_development_dependency 'pronto-rubocop'

  spec.add_development_dependency 'safe_pusher'

  # Debugger
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-byebug'

  # Specs
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'test-unit' # required for ruby > 2.1

  # Spec factories
  spec.add_development_dependency 'factory_bot_rails', '>= 5.0.2'

  # Dummy app database
  spec.add_development_dependency 'pg'

  # GraphiQL
  spec.add_development_dependency 'graphiql-rails'
end
