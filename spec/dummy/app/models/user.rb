# A model class for the sample application.
class User < ActiveRecord::Base
  acts_as_broadcaster_subscriber
  acts_as_broadcaster_publisher
end
