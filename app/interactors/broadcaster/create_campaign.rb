module Broadcaster
  class CreateCampaign
    include Interactor

    def call
      Broadcaster::Campaign.create!(publisher: publisher, label: label)
    end

    delegate :publisher, :label, to: :context
  end
end
