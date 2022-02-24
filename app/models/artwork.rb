class Artwork < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:title, :category]

  has_one_attached :photo
  belongs_to :user
  validates :title, :category, presence: true
end
