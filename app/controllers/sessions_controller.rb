class SessionsController < Devise::OmniauthCallbacksController
  skip_before_action :require_profile
end
