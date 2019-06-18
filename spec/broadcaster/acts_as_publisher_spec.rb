require 'rails_helper'

RSpec.describe Broadcaster::ActsAsPublisher do
  describe '#broadcaster_campaigns' do
    let(:publisher) { create :user }

    it { expect(publisher).to respond_to(:broadcaster_campaigns) }
  end
end
