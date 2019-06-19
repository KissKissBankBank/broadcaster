require 'rails_helper'

RSpec.describe Broadcaster::CreateSubscription do
  subject(:create_subscription) do
    described_class.call(
      subscriber: subscriber,
      broadcaster_campaign: broadcaster_campaign,
    )
  end

  context 'when subscriber and broadcaster_campaign are valid' do
    let(:subscriber) { create :user }
    let(:broadcaster_campaign) { create :campaign }

    it { expect(create_subscription).to be_success }

    it 'creates a broadcaster_subscription' do
      expect { create_subscription }.to(
        change { Broadcaster::Subscription.count }.by(1),
      )
    end
  end
end
