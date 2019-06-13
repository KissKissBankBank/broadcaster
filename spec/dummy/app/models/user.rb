# A model class for the sample application.
class User < ActiveRecord::Base
  include Broadcaster::ActsAsPublisher
  include Broadcaster::ActsAsSubscriber
end
