# Broadcaster
## Motivations and principles
Broadcaster is an engine keeping track of your user's publications campaigns and subscriptions. Each publication campaign should belong to a publisher, and each subscription should belong to a subscriber.

The subscriber will therefore have access to the publication campaigns he / she has subscribed to, through its subscriptions.

Any subscription is accessible via a unique `unsubscribe_token`, and can be deactivated (or reactivated).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'broadcaster'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install broadcaster

On a rails application, execute `rake db:migrate` to create the broadcaster tables.

Then plug `Broadcaster::Subscription` or `Broadcaster::Campaign` to any publisher or subscriber. Include the following modules:
```rb
class MyPublisher
  include Broadcaster::Publisher
  
  ...
end
```
```rb
class MySubscriber
  include Broadcaster::Subscriber
  
  ...
end
```

## Usage
Access a publisher's `publication_campaigns`: 
```rb
my_publisher = MyPublisher.find(...)

my_publisher.publication_campaigns
# => [#<Broadcaster::Campaign ...>, ...]
```

Or a subscriber's `subscriptions`: 
```rb
my_subscriber = MySubscriber.find(...)

my_subscriber.subscriptions
# => [#<Broadcaster::Subscription ...>, ...]
```

Access all the subscriptions of a campaign: 
```rb
campaign = Broadcaster::Campaign.find(...)

subscriptions = campaign.subscribtions
active_subscribtions = campaign.subscribtions.active
```

Access the campaign of a subscribtion: 
```rb
subscription = Broadcaster::Subscription.find(...)

subscription.broadcaster_campaign
```

Deactivate a subscription: 
```rb
subscription = Broadcaster::Subscription.find(...)

subscription.deactivate
```

Or activate a subscription: 
```rb
subscription = Broadcaster::Subscription.find(...)

subscription.activate
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
