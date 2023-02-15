require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
  it 'There is a link to visit create a new cover letter' do 
    visit home_path
  end
end
