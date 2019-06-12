# Setup useful development data.
#
# Please make sure that this file is idempotent: it should only create one set
# of data if you call `rake db:seed` twice.

require_relative 'seeds/user_seeds'
require_relative 'seeds/campaign_seeds'
require_relative 'seeds/subscription_seeds'
