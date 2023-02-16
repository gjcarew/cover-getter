class JobsController < ApplicationController
  def new; end

  def create
    job = Job.new(job_params)
    job.user_id = current_user.id

    if job.valid?
      add_letter_to(job)
      redirect_to job_path(job)
    else
      flash.now[:messages] = job.errors.full_messages[0]
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    require 'pry';binding.pry
  end

  private

  def job_params
    params.permit(:role, :company, :description)
  end

  def add_letter_to(job)
    prompt = PromptBuilder.new(job, current_user.profile)
    letter_text = OpenAI::TextService.new.cover_letter(prompt.text)
    job.letter_text = letter_text.content
    job.save
  end
end
