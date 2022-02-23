class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :artists

  def artists
    @user = User.find(params[:id])
    @services = Service.where(user: @user)
    @commission = Commission.new
  end

  def thanks

  end

  def digital_art
    @artworks = Artwork.where(category: 'digital art')
  end

  def paintings
    @artworks = Artwork.where(category: 'paintings')
  end

  def sculptures
    @artworks = Artwork.where(category: 'sculptures')
  end
end
