require 'rails_helper'

RSpec.describe Broadcaster::Campaign do
  subject(:campaign) { create :campaign }

  it 'is valid' do
    expect(campaign).to be_valid
  end
end
