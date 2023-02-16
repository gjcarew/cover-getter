class HomeController < ApplicationController
  before_action :require_profile

  def index
  end

  def require_profile
    redirect_to new_profile_path unless current_user&.profile
  end
end
