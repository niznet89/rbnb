class UsersController < ApplicationController

  def artists
    @user = User.find(params[:id])
  end
end
