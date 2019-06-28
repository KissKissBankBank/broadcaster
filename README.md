# Broadcaster

![Now Live](https://media.giphy.com/media/fitufgTSd3KXObPIoi/giphy.gif)

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

Then include the following modules to plug `Broadcaster::Subscription` or `Broadcaster::Campaign` to any publisher or subscriber:
```rb
class MyPublisher
  acts_as_broadcaster_subscriber

  ...
end
```
```rb
class MySubscriber
  acts_as_broadcaster_subscriber

  ...
end
```

## Usage
Access a publisher's `broadcaster_campaigns`:
```rb
my_publisher = MyPublisher.find(...)

my_publisher.broadcaster_campaigns
# => [#<Broadcaster::Campaign ...>, ...]
```

Or a subscriber's `broadcaster_subscriptions`:
```rb
my_subscriber = MySubscriber.find(...)

my_subscriber.broadcaster_subscriptions
# => [#<Broadcaster::Subscription ...>, ...]
```

Access the subscriptions of a campaign:
```rb
campaign = Broadcaster::Campaign.find(...)

subscriptions = campaign.broadcaster_subscriptions
active_subscriptions = campaign.broadcaster_subscriptions.active
```

Given a subscription, access its publication campaign:
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

## GraphQL API

Broadcaster exposes its `campaigns` and `subscriptions` types in a GraphQL API. You can use them directly in your subscriber or publisher types.

### API Configuration

To set the public names of your `broadcaster_campaigns` and `broadcaster_subscriptions` in the GraphQL API, proceed as follow:
```rb
# config/initializers/broadcaster.rb
Broadcaster.configure do |config|
  config.graphql_broadcaster_campaign_name = 'MyCustomCampaignName'
  config.graphql_broadcaster_subscription_name = 'MyCustomSubscriptionName'
end
```
To avoid letting your client know the dependency, default names are `Campaign` and `Subscription`

### API usage

```rb
# app/graphql/types/subscriber_type.rb
  field :subscriptions,
        types[!Types::Broadcaster::SubscriptionType],
        'The subscriptions of the user',
        property: :broadcaster_subscriptions
```

```rb
# app/graphql/types/publisher_type.rb
  field :campaigns,
        types[!Types::Broadcaster::CampaignType],
        'The publication campaigns of the user',
        property: :broadcaster_campaigns
```

### API Development

Broadcaster is equiped with the `GraphiQL` engine, to let you test your queries in your local environment. To access `graphiql`, make sure
the migrations passed (`rake db:migrate`).

Then go to `spec/dummy`. Run the migrations to have the `user` table inside your dummy app: (`rake db:migrate`).

Then launch your dummy server: `rails s -p 3444`

You can access `graphiql` by visiting: `localhost:3444/graphiql`

Happy coding !

#### Query Sample

```
# query
query User($id: Int!) {
  user(id: $id) {
    campaigns {
      label
      uuid
      subscriptions {
        active   
        uuid
      }
      subscriptionsCount
    }
    subscriptions {
      active
    }
    id
  }
}
```

```
# results
{
  "data": {
    "user": {
      "campaigns": [
        {
          "label": "test",
          "uuid": "094cb361-c894-4cf7-ad24-0df317b72b13",
          "subscriptions": [
            {
              "active": true,
              "uuid": "5478ce4c-f982-4251-ba5c-bb625dc4fd9d"
            },
            {
              "active": true,
              "uuid": "bf970c85-0ebb-4cf3-bb86-800591ea2153"
            }
          ],
          "subscriptionsCount": 2
        },
        {
          "label": "post_launch",
          "uuid": "2786c3af-2b80-4cf8-bff4-af9426d5ad7b",
          "subscriptions": [
            {
              "active": false,
              "uuid": "7921547f-bf3d-4273-917f-24209b3cdc61"
            },
            {
              "active": true,
              "uuid": "77860011-e16a-486b-9245-2b9e3db34b1f"
            }
          ],
          "subscriptionsCount": 2
        }
      ],
      "subscriptions": [],
      "id": 1
    }
  }
}
```

## Development

After checking out the repo, run `bundle install` to install dependencies. Create the broadcaster tables with `bundle exec rake db:create`, then `bundle exec rake db:migrate` to launch the migrations. Run `bundle exec rspec spec` to run the tests.

To test the plugged engine, move to `cd spec/dummy` and create the user table with `bundle exec rake db:migrate`. Run `rails c` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

To ensure specs and linter validity, before opening your pull request run `$ safepush test lint push open`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/KissKissBankBank/broadcaster. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Broadcaster project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/KissKissBankBank/broadcaster/blob/master/CODE_OF_CONDUCT.md).
