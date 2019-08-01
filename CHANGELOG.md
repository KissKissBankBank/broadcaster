# Changelog

This project adheres to [Semantic Versioning](http://semver.org)

## [0.4.1] - 2019-06-28

- Remove `gemfury` dependency and add `rubygems` as the default host repository

## [0.4.0] - 2019-06-28

Features:
- Add unique UUID to broadcaster campaigns
- Add unique UUID to broadcaster subscriptions
- Add the GraphQL Campaign type
- Add the GraphQL Subscription type

## [0.3.0] - 2019-06-19

Features:
 - Add job to create campaign
 - Add job to create subscription

Breaking changes:
 - Rename indexes

## [0.2.3] - 2019-06-19

 - Bugfix: fix index migrations

## [0.2.2] - 2019-06-19

Improvements:
 - Add index on `broadcaster_campaign` and `broadcaster_subscriptions`

## [0.2.1] - 2019-06-18

Improvements:
 - Using `default: true` for subscription's `active` field

## [0.2.0] - 2019-06-18

Breaking changes:
 - acts_as_subscriber => acts_as_broadcaster_subscriber
 - acts_as_publisher => acts_as_broadcaster_publisher
 - `publication_campaigns` => `broadcaster_campaign`
 - `subscriptions` => `broadcaster_subscriptions`

## [0.1.2] - 2019-06-18

Bugfixes:
 - Remove useless specs

## [0.1.1] - 2019-06-18

Bugfixes:
 - Load des modèles `campaign` et `subscription` sur rails 3

## [0.1.0] - 2019-06-17

First release :tada:

Feature:
 - use `Broadcaster::Campaign`
 - use `Broadcaster::Subscription`
 - activate a subscription
 - deactivate a subscription
