require 'rails_helper'

RSpec.describe Job, type: :model do
  describe 'associations' do
    it { should belong_to :user }
  end
  
  describe 'validations' do 
    it { should validate_presence_of(:role) }
    it { should validate_presence_of(:company) }
  end
end