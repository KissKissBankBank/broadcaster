Rails.application.routes.draw do
  mount SubscriptionsBroker::Engine => '/subscriptions_broker'
end
