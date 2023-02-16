require 'rails_helper'

RSpec.describe "New cover letter", type: :view do

  before :each do 
    user = double('user')
    allow_any_instance_of(HomeController).to receive(:require_profile).and_return(true)
    allow_any_instance_of(ApplicationController).to receive(:authenticate_user!).and_return(user)
  end

  describe 'Happy path' do
    it 'There is a form to generate a new cover letter' do
      visit new_job_path
      fill_in :role, with: 'Software engineer'
      fill_in :company, with: 'Google'
      fill_in :description, with: 'Make a search engine'
      click_on 'Generate'
      expect(page).to have_content('Dear Hiring Manager')
    end
  end
end