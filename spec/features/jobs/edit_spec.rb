require 'feature_helper'

RSpec.describe 'Edit cover letter', type: :feature do
  before :each do 
    @user = User.create!(email: 'example@user.com', password: 'ValidPW')
    Profile.create!(user_id: @user.id, 
                    skills: 'Ruby',
                    experience: 'I worked at Amazon as a software engineer',
                    education: 'Turing School of Software and Design',
                    projects: 'Cover Getter, a rails project using ChatGPT')
    login_as(@user)
    allow_any_instance_of(HomeController).to receive(:require_profile).and_return(true)

    @job = Job.create!(user_id: @user.id,
      role: 'Software engineer',
      company: 'Google',
      description: 'Make a search engine',
      letter_text: 'Dear hiring manager, blah blah blah')
  end

  it 'there is button on the jobs#show page to edit a cover letter' do 
    visit job_path(@job)
    click_on 'Edit'

    expect(current_path).to eq(edit_job_path(@job))
  end

  it 'I can edit the cover letter text' do
    visit edit_job_path(@job)

    fill_in :job_letter_text, with: 'Here is what I want to say'
    click_on 'Save'
    updated_job = Job.find(@job.id)
    expect(updated_job.letter_text).to eq('Here is what I want to say')
    expect(updated_job.company).to eq('Google')
    expect(updated_job.role).to eq('Software engineer')
  end

  it 'I can re-generate the cover letter text' do
    visit edit_job_path(@job)
    click_on 'Re-generate'
    updated_job = Job.find(@job.id)

    expect(@job.letter_text).not_to eq(updated_job.letter_text)
  end
end
