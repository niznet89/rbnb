class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include PgSearch::Model
  multisearchable against: [:first_name, :last_name]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :artworks, dependent: :destroy
  has_many :services, dependent: :destroy
  has_many :commissions, dependent: :destroy

  def name
    "#{first_name} #{last_name}"
  end
  
end
