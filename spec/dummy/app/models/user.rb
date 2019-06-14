# A model class for the sample application.
class User < ActiveRecord::Base
  include Broadcaster::ActsAsSubscriber
  include Broadcaster::ActsAsPublisher
end
