class Users::SessionsController < Devise::SessionsController
  skip_before_action :require_profile
end
