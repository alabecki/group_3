class UsersController < ApplicationController
  def new
  end
  
  def map 
    @users = User.all
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow user.username
    end
  end
  
  
  
end
