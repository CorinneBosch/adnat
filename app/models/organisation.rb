class Organisation < ApplicationRecord
  validates_uniqueness_of :name
  validates :name, presence: true
  validates :hourly_rate, presence: true
end
