class ServicesController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @services = @user.services
  end
end
