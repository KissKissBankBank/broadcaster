lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'subscriptions_broker/version'

Gem::Specification.new do |spec|
  spec.name          = 'subscriptions_broker'
  spec.version       = SubscriptionsBroker::VERSION
  spec.authors       = ['William Pollet']
  spec.email         = ['polletwilliam@gmail.com']

  spec.summary       = 'manage your publisher / subscriber relationshups'
  spec.homepage      = 'https://www.github.com/kisskissbankbank/subscriptions_broker'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org.
  # To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or
  # delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'http://mygemserver.com'

    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = 'https://www.github.com/kisskissbankbank/subscriptions_broker'
    spec.metadata['changelog_uri'] = 'https://www.github.com/kisskissbankbank/subscriptions_broker/CHANGELOG.md'
  else
    raise 'RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes.'
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

  # Code quality checker
  spec.add_development_dependency 'fashion_police', '~> 2.0.1'

  # linter
  spec.add_development_dependency 'rubocop', '~> 0.60'

  # coverage
  spec.add_development_dependency 'simplecov', '~> 0.16.1'

  # Code review automation
  spec.add_development_dependency 'pronto'

  # Rubocop Adapter for pronto
  spec.add_development_dependency 'pronto-rubocop'

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
end
