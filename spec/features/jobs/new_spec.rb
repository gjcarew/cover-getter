require 'feature_helper'

RSpec.describe "New cover letter", type: :feature do

  before :each do 
    user = User.create!(email: 'example@user.com', password: 'ValidPW')
    Profile.create!(user_id: user.id, 
                    skills: 'Ruby',
                    experience: 'I worked at Amazon as a software engineer',
                    education: 'Turing School of Software and Design',
                    projects: 'Cover Getter, a rails project using ChatGPT')
    login_as(user)
    allow_any_instance_of(HomeController).to receive(:require_profile).and_return(true)
  end

  describe 'Happy path' do
    it 'There is a form to generate a new cover letter' do
      visit new_job_path
      fill_in :job_role, with: 'Software engineer'
      fill_in :job_company, with: 'Google'
      fill_in :job_description, with: 'Make a search engine'
      click_on 'Generate'
      expect(page).to have_content('Software engineer at Google')
    end
  end
end