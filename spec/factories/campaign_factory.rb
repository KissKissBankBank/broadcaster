FactoryBot.define do
  factory :campaign, class: 'Broadcaster::Campaign' do
    label { 'regular_news' }

    trait :with_subscriptions do
      after(:create) do |campaign|
        campaign.broadcaster_subscriptions = [
          create(
            :subscription,
            broadcaster_campaign: campaign,
            subscriber_id: create(:user).id,
          ),
        ]
      end
    end
  end
end
