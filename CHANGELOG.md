# Changelog

This project adheres to [Semantic Versioning](http://semver.org)

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
