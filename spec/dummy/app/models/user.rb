# A model class for the sample application.
class User < ActiveRecord::Base
  has_many :subscriptions, as: :subscriber, dependent: :destroy
  has_many :publications_channels, as: :publisher, dependent: :destroy
end
