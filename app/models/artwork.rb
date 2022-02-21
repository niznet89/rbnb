class Artwork < ApplicationRecord
  belongs_to :user

  validates :title, :category, presence: true
end
