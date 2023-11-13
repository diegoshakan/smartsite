class Schedule < ApplicationRecord
  belongs_to :location

  validates :week_days, :hour, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[hour week_days]
  end
end
