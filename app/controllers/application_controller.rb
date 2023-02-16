class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :require_profile

  def require_profile
    redirect_to new_profile_path if current_user && current_user.profile.nil?
  end
end
