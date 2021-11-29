class Shift < ApplicationRecord
  has_one :user
  belongs_to :organisation
  
  validates :employee, presence: true
  validates :shift_start, presence: true
  validates :shift_end, presence: true
  validates :break_length, presence: true
end
