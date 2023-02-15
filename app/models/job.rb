class Job < ApplicationRecord
  belongs_to :user
  validates :role, presence: true
  validates :company, presence: true
end