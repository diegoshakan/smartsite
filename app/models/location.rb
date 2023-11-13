class Location < ApplicationRecord
  has_many :schedules, dependent: :destroy

  accepts_nested_attributes_for :schedules, allow_destroy: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[content fountain locker_room mask opened title towel]
  end
end
