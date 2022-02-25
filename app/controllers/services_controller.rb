class ServicesController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @services = @user.services
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @user = current_user
    @service.user = @user
    if @service.save
      redirect_to edit_profile_path(current_user), notice: 'Good job! A new service was created!'
    else
      render 'users/edit'
    end
    authorize @service
  end

  def edit
    @service = Service.find(params[:id])
    authorize @service
  end

  def update
    @service = Service.find(params[:id])
    @service.update(service_params)

    # no need for app/views/restaurants/update.html.erb
    redirect_to edit_profile_path(current_user)
    authorize @service
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to edit_profile_path(current_user)
  end

  private

  def service_params
    params.require(:service).permit(:name, :category, :price)
  end
end
