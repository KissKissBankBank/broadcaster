module Broadcaster
  module Identifiable
    extend ActiveSupport::Concern

    included do
      before_save :assign_uuid

      private

      def assign_uuid
        self.uuid ||= SecureRandom.uuid
      end
    end
  end
end
