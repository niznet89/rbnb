class Service < ApplicationRecord
  belongs_to :user
  has_many :commissions

  def label
    "#{name} -- Price: #{price}€"
  end
end
