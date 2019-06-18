require 'rails_helper'

RSpec.describe Broadcaster::ActsAsSubscriber do
  describe '#broadcaster_subscriptions' do
    let(:subscriber) { create :user }

    it { expect(subscriber).to respond_to(:broadcaster_subscriptions) }
  end
end
