require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do

  before :each do 
    user = double('user')
    allow_any_instance_of(HomeController).to receive(:require_profile).and_return(true)
    allow_any_instance_of(ApplicationController).to receive(:authenticate_user!).and_return(user)
  end

  it 'There is a link to create a new cover letter' do
    visit root_path
    click_on 'Create a new cover letter'
    expect(current_path).to eq(new_job_path)
  end
end
