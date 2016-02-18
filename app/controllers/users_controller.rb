class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def map 
    @users = User.all
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow user.username
    end
  end

 def create
    @user = User.new(user_params)
    if @user.save
      # flash[:success] = "Welcome to the Random Encounters!"   <will need views/layouts/application.html.erb to work>
      redirect_to @user
    else
      render 'new'
    end
 end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :street_address, :city, :country, :postal_code,
                                   :password_confirmation)
    end
end

