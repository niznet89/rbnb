class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :artists

  def artists
    @user = User.find(params[:id])
    @services = Service.where(user: @user)
    @commission = Commission.new
  end

  def thanks

  end
end
