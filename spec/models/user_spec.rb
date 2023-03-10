require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :jobs }
  it { should have_one :profile }
end
