class CommissionsController < ApplicationController
  before_action :set_user

  def index
    @commissions = Commission.all
  end

  def new
    @commission = Commission.new
  end

  def show; end

  def create
    @commission = Commission.new(commission_params)
    @commission.user = @user
    @commission.art_price = params["commission"]["art_price"]
    if @commission.save
      redirect_to artists_path(@user)
    else
      render "artists/show"
    end
  end

  def edit; end

  def update
    @commission.update(commission_params)
    redirect_to user_path(@user)
  end

  def destroy
    @commission.destroy
    redirect_to user_path(@user)
  end

  private

  def commission_params
    params.require(:commission).permit(:price, :art_description, :service_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

end
