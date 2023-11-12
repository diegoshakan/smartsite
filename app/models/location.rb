class Location < ApplicationRecord
  has_many :schedules, dependent: :destroy

  validates :title, :content, :opened, :mask, :towel, :fountain, :locker_room, presence: true
end
