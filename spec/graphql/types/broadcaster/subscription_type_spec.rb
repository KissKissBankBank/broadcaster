require 'rails_helper'

RSpec.describe Types::Broadcaster::SubscriptionType do
  let(:resolved) { graphql_resolve(field_name, subscription, args, ctx) }
  let(:subscription) do
    build_stubbed :subscription, uuid: 'uei42', active: true
  end
  let(:args) {}
  let(:ctx) {}

  describe '#uuid' do
    let(:field_name) { 'uuid' }

    it 'returns the subscription uuid' do
      expect(resolved).to eq('uei42')
    end
  end

  describe '#broadcaster_campaign' do
    let!(:campaign) { build_stubbed :campaign }
    let(:subscription) do
      build_stubbed :subscription,
                    broadcaster_campaign: campaign
    end

    let(:field_name) { 'broadcasterCampaign' }

    it 'returns the campaign' do
      expect(resolved).to eq(campaign)
    end
  end

  describe '#active' do
    let(:field_name) { 'active' }

    it 'returns the active' do
      expect(resolved).to eq(true)
    end
  end
end
