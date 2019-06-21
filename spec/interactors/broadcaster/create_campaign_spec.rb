require 'rails_helper'

RSpec.describe Broadcaster::CreateCampaign do
  subject(:create_campaign) do
    described_class.call(publisher: publisher, label: label)
  end

  context 'when publisher and label are valid' do
    let(:publisher) { create :user }
    let(:label) { 'launch' }

    it { expect(create_campaign).to be_a_success }

    it 'creates a broadcaster_campaign' do
      expect { create_campaign }.to(
        change { Broadcaster::Campaign.count }.by(1),
      )
    end
  end
end
