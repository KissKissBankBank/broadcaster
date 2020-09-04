source 'https://rubygems.org'

source "https://#{ENV['FURY_AUTH']}@gem.fury.io/kisskissbankbankandco/" do
  # Miscellaneous utility code
  gem 'tote_bag',
      git: 'git@github.com:KissKissBankBank/tote_bag.git',
      branch: 'migration-export'
end

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

# Specify your gem's dependencies in broadcaster.gemspec
gemspec
