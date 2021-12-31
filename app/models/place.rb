class Place < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :memo, allow_blank: true, length: { maximum: 30 }
end