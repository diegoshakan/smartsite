class Schedule < ApplicationRecord
  belongs_to :location

  validates :week_days, :hour, presence: true
end
