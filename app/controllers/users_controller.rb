class UsersController < ApplicationController
  
 before_action :correct_user,   only: [:edit, :update]



  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  

  def map 
    @users = User.all
    
    # Username Search
    if params[:search]
      @users = User.search(params[:search])
    end
    
    # Game Search
    if params[:lol] == "true" || params[:dota2] == "true" || params[:smite] == "true" || params[:hots] == "true"
      @users = User.gameSearch(params[:lol], params[:dota2], params[:smite], params[:hots] )
    end
    
    # Generate Map with Appropriate Users
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow user.username
    end
  end
  
  

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      #flash[:success] = "Profile updated"
      redirect_to @user

    else
      render 'edit'
    end
  end
 
 
  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :street_address, :city, :country, :postal_code,
                                   :password_confirmation, :lol, :dota2, :smite, :hots, :description)
    end    
    
    def correct_user
          @user = User.find(params[:id])
          redirect_to(root_url) unless current_user?(@user)
    end
    
end

