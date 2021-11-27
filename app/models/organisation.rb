class Organisation < ApplicationRecord
  has_many :shifts
  validates_uniqueness_of :name
  validates :name, presence: true, length: { maximum: 30,
    too_long: "is above maximum length of %{count}" }
  validates :hourly_rate, presence: true
end
