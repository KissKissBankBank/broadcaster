require 'rails_helper'

RSpec.describe Broadcaster::Subscription do
  subject(:subscription) do
    create :subscription,
           subscriber_id: subscriber.id,
           subscriber_type: 'User',
           broadcaster_campaign: campaign
  end

  let(:campaign) { create :campaign }
  let(:subscriber) { create :user }

  it 'is valid' do
    expect(subscription).to be_valid
  end
end
