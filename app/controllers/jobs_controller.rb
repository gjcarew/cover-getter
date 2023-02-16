class JobsController < ApplicationController
  def new; end

  def create
    require 'pry';binding.pry
    job = Job.new(job_params)
    
    if job.valid?
      prompt = PromptBuilder.new(job_params, current_user.profile)
      letter_text = OpenAI::TextService.new.cover_letter(prompt.text)
      job.letter_text = letter_text
      job.save
      redirect_to job_path(job)
    else
      flash.now[:messages] = job.errors.full_messages[0]
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  private

  def job_params
    params.permit(:role, :company, :description)
  end
end