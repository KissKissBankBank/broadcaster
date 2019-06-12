# Broadcaster

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'broadcaster'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install broadcaster

## Usage

On a rails application, execute `rake db:migrate` to create the broadcaster tables.

You can then plug the `subscription` model or the `campaign` model to any publisher or subscriber.

A way to enjoy the functionalities of the library and preventing any leaks into your business logic is by creating a scoped concern:

```rb
module Publisher
  extend ActiveSupport::Concern

  included do
    has_many :publication_campaigns, class_name: 'Broadcaster::Campaign', as: :publisher
  end
end

module Subscriber
  extend ActiveSupport::Concern

  included do
    has_many :subscriptions, class_name: 'Broadcaster::Subscription', as: :subscriber
  end
end
```

Then include the module in your model, and you can manage and broadcast your campaigns !

```rb
class YourModel
  include Publisher
end

your_model = YourModel.find(...)

your_model.publication_campaigns
# => [#<Broadcaster::Campaign ...>, ...]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exect rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/broadcaster. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Broadcaster project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/broadcaster/blob/master/CODE_OF_CONDUCT.md).
