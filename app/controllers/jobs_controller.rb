class JobsController < ApplicationController
  def new
    @job = Job.new()
  end

  def create
    attributes = job_params.merge({ user_id: current_user.id })
    job = Job.new(attributes)
    if job.valid?
      add_letter_to(job) if params[:commit] == 'Generate'
      job.save
      redirect_to job_path(job)
    else
      flash.now[:messages] = job.errors.full_messages[0]
      redirect_to new_job_path
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  private

  def job_params
    params.require(:job).permit(:role, :company, :description, :letter_text)
  end

  def add_letter_to(job)
    prompt = PromptBuilder.new(job, current_user.profile)
    letter_text = OpenAI::TextService.new.cover_letter(prompt.text)
    job.letter_text = letter_text.content
  end
end
