require 'rails_helper'

RSpec.describe Types::Broadcaster::CampaignType do
  let(:resolved) { graphql_resolve(field_name, campaign, args, ctx) }
  let(:campaign) do
    build_stubbed :campaign, uuid: 'uef42', label: 'launch'
  end
  let(:args) {}
  let(:ctx) {}

  describe '#uuid' do
    let(:field_name) { 'uuid' }

    it 'returns the campaign uuid' do
      expect(resolved).to eq('uef42')
    end
  end

  describe '#subscriptionsCount' do
    let(:user) { create :user }
    let(:campaign) do
      create :campaign,
             :with_subscriptions
    end

    let(:field_name) { 'subscriptionsCount' }

    it 'returns the subscription count' do
      expect(resolved).to eq(1)
    end
  end

  describe '#subscriptions' do
    let!(:subscription) { build_stubbed :subscription }
    let(:campaign) do
      build_stubbed :campaign,
                    broadcaster_subscriptions: [subscription]
    end

    let(:field_name) { 'subscriptions' }

    it 'returns the subscription' do
      expect(resolved).to eq([subscription])
    end
  end

  describe '#label' do
    let(:field_name) { 'label' }

    it 'returns the label' do
      expect(resolved).to eq('launch')
    end
  end
end
