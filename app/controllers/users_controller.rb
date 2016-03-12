class UsersController < ApplicationController
  
 before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
 before_action :correct_user,   only: [:edit, :update]
 before_action :admin_user,     only: :destroy

  def index
     @users = User.paginate(page: params[:page])
   
    # Username Search
    if params[:search]
      @users = User.search(params[:search]).paginate(page: params[:page])
    end
    
    # Game Search
    if params[:lol] == "true" || params[:dota2] == "true" || params[:smite] == "true" || params[:hots] == "true"
      @users = User.gameSearch(params[:lol], params[:dota2], params[:smite], params[:hots] ).paginate(page: params[:page])
    end
    
  end



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
      user_path = view_context.link_to user.username, user_path(user)
      marker.lat user.latitude
      marker.lng user.longitude
      marker.picture({
        "url" => "https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Red_flag.svg/2000px-Red_flag.svg.png",
        "width" => 32,
        "height" => 32
      }) 
      marker.infowindow render_to_string(:partial => "/users/infobox", :locals => {:username => user.username, :lol => user.lol, :dota2 => user.dota2, :smite => user.smite, :hots => user.hots, :id => user.id})
    end
    
  end
  
  

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
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
      flash[:success] = "Profile updated"
      redirect_to @user

    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
 
 
  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :street_address, :city, :state, :country, :postal_code,
                                   :password_confirmation, :lol, :dota2, :smite, :hots, :description)
    end    
    
def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
end

def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
end

def admin_user
      redirect_to(root_url) unless current_user.admin?
end
  
end

