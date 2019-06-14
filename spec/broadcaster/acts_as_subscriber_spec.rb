require 'rails_helper'

RSpec.describe Broadcaster::ActsAsSubscriber do
  describe '#self.publisher?' do
    it { expect(User).to be_publisher }
  end

  describe '#subscriptions' do
    let(:subscriber) { create :user }

    it { expect(subscriber).to respond_to(:subscriptions) }
  end
end
