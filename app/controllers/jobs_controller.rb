class JobsController < ApplicationController
  def new
    @job = Job.new()
  end

  def create
    attributes = job_params.merge({ user_id: current_user.id })
    job = Job.new(attributes)
    if job.valid?
      add_letter_to(job)
      redirect_to edit_job_path(job)
    else
      flash.now[:messages] = job.errors.full_messages[0]
      redirect_to new_job_path
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    job = Job.find(params[:id])
    job.update(job_params)
    add_letter_to(job) if params[:commit] == 'Re-generate'
    redirect_to job_path(job)
  end

  def show
    @job = Job.find(params[:id])
  end

  def destroy
    job = Job.find(params[:id])
    job.destroy
    flash[:success] = 'Cover letter deleted'
    redirect_to root_path
  end

  private

  def job_params
    params.require(:job).permit(:role, :company, :description, :letter_text)
  end

  def add_letter_to(job)
    prompt = PromptBuilder.new(job, current_user.profile)
    letter_text = OpenAI::TextService.new.cover_letter(prompt.text)
    job.letter_text = letter_text.content
    job.save
  end
end
