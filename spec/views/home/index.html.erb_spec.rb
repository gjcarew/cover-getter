require 'feature_helper'

RSpec.describe "home/index.html.erb", type: :view do

  before :each do 
    @user = User.create!(email: 'example@user.com', password: 'ValidPW')
    Profile.create!(user_id: @user.id, 
                    skills: 'Ruby',
                    experience: 'I worked at Amazon as a software engineer',
                    education: 'Turing School of Software and Design',
                    projects: 'Cover Getter, a rails project using ChatGPT')
    login_as(@user)
    # allow_any_instance_of(HomeController).to receive(:require_profile).and_return(true)
    # Job.create!(user_id: @user.id,
    #   role: 'Software engineer',
    #   company: 'Google',
    #   description: 'Make a search engine',
    #   letter_text: 'Dear hiring manager, blah blah blah')
  end

  let(:job1) do
    Job.create!(user_id: @user.id,
                role: 'Software engineer',
                company: 'Google',
                description: 'Make a search engine',
                letter_text: 'Dear hiring manager, blah blah blah')
  end

  let(:job2) do
    Job.create!(user_id: @user.id,
                role: 'Software engineer',
                company: 'Netflix',
                description: 'Recommend a movie',
                letter_text: 'Forrest Gump is a decent movie')
  end

  it 'There is a link to create a new cover letter' do
    visit root_path
    click_on 'Create a new cover letter'
    expect(current_path).to eq(new_job_path)
  end

  it 'There is a list of all companies/ job titles' do
    job1
    job2

    visit root_path
    expect(page).to have_content(job1.role)
    expect(page).to have_content(job1.company)
    expect(page).to have_content(job2.role)
    expect(page).to have_content(job2.company)
  end
end
