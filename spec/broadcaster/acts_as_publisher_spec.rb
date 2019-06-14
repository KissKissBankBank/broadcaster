require 'rails_helper'

RSpec.describe Broadcaster::ActsAsPublisher do
  describe '#self.publisher?' do
    it { expect(User).to be_publisher }
  end

  describe '#publication_campaigns' do
    let(:publisher) { create :user }

    it { expect(publisher).to respond_to(:publication_campaigns) }
  end
end
