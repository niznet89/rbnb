class Service < ApplicationRecord
  belongs_to :user
  #has_one :commission

  def label
    "#{name} -- Price: #{price}€"
  end
end
