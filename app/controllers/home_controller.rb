class HomeController < ApplicationController
  def index
    @jobs = Job.where(user_id: current_user.id)
  end
end
