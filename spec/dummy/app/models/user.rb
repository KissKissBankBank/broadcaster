# A model class for the sample application.
class User < ActiveRecord::Base
  acts_as_subscriber
  acts_as_publisher
end
