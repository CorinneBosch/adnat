class Organisation < ApplicationRecord
  has_many :shifts, dependent: :destroy
  has_many :users, dependent: :nullify

  validates :name, uniqueness: { message: -> (object, data) do
      "#{data[:value]} is already taken! Please choose other name"
    end
  }
  validates :name, presence: true, length: { maximum: 30,
    too_long: "is above maximum length of %{count}" }
  validates :hourly_rate, presence: true
end
