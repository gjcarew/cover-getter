require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'associations' do
    it { should belong_to :user }
  end
  
  describe 'validations' do 
    
  end
end