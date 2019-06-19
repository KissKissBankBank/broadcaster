module Broadcaster
  class CreateCampaign
    include Interactor
    include Interactor::Contract

    input :publisher
    input :label, type: String

    def call
      Broadcaster::Campaign.create!(publisher: publisher, label: label)
    end

    delegate :publisher, :label, to: :context
  end
end
