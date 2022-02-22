class Service < ApplicationRecord
  belongs_to :user

  def label
    "#{name} -- Price: #{price}€"
  end
end
