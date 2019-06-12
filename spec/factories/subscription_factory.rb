FactoryBot.define do
  factory :subscription, class: 'Broadcaster::Subscription' do
    active { true }
  end
end
