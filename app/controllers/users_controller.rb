class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :artists

  def artists
    @user = User.find(params[:id])
    @services = Service.where(user: @user)
    @commission = Commission.new
  end

  def thanks; end

  def digital_art
    @artworks = Artwork.where(category: 'digital art')
  end

  def paintings
    @artworks = Artwork.where(category: 'painting')
  end

  def sculptures
    @artworks = Artwork.where(category: 'sculpture')
  end
  
  def my_bookings
    @commissions = Commission.where(user: current_user)
  end
  
end
