class StaticPagesController < ApplicationController

  def show
      @micropost = current_user.microposts.build if logged_in?
    end

end
