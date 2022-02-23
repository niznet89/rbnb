class Artwork < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  validates :title, :category, presence: true
end
