class ProfilesController < ApplicationController
  skip_before_action :require_profile, only: [:new, :create]

  def new
    @profile = Profile.new()
  end

  def create
    attributes = profile_params.merge({user_id: current_user.id})
    Profile.create(attributes)

    redirect_to home_index_path
  end

  private

  def profile_params
    params.require(:profile).permit(:skills, :experience, :education, :projects)
  end
end
