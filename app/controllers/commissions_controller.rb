class CommissionsController < ApplicationController
  before_action :set_user, :set_service

  def index
    @commissions = Commission.all
  end

  def new
    @commission = Commission.new
  end

  def show; end

  def create
    @commission = Commission.new(commission_params)
    @commission.service.user = @user
    if @commission.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit; end

  def update
    @commission.update(commission_params)
    redirect_to user_path(@user)

  def destroy
    @commission.destroy
    redirect_to user_path(@user)
  end

  private

  def commission_params
    params.require(:commission).permit(:price, :art_description, :user_id, :service_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_service
    @service = Service.find(params[:service_id])
  end
end
