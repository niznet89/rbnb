class CommissionsController < ApplicationController
  # before_action :set_user

  def index
    @commissions = Commission.all
  end

  def new
    @commission = Commission.new
  end

  def show; end

  def create
    @commission = Commission.new(commission_params)
    @service = Service.find(commission_params[:service_id])
    @commission.user = current_user
    @commission.service = @service
    # @commission.art_price = params["commission"]["art_price"]
    @commission.art_price = @service.price

    if @commission.save
      redirect_to thanks_path
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
    redirect_to commission_path(@commission)
  end

  def my_bookings

    @commissions = Commission.where.not()

    User.where.not(favorite_animal: "snake")

    @services = Service.find(commission_params[:service_id])
    @user = User.find(service_params[:user_id])
    @commissions.services = @commissions
    @commissions.count
  end

  private

  def commission_params
    params.require(:commission).permit(:price, :art_description, :service_id, :user_id)
  end

  def service_params
    params.require(:service).permit(:name, :category, :price, :user_id)
  end
  # def set_user
  #   @user = User.find(params[:user_id])
  # end

end
