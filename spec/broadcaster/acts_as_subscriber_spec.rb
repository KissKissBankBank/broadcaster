require 'rails_helper'

RSpec.describe Broadcaster::ActsAsSubscriber do
  describe '#subscriptions' do
    let(:subscriber) { create :user }

    it { expect(subscriber).to respond_to(:subscriptions) }
  end
end
