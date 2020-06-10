class Surgery < ApplicationRecord
  has_many :doctor_surgeries

  has_many :doctors, through: :doctor_surgeries

  def self.same_day
    require "pry"; binding.pry
  end
end
