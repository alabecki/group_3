class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Comment posted!"
      redirect_to current_user
    else
      flash.now[:danger] = "Comment failed to post."
      @feed_items = []
      render 'shows'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Comment deleted."
    redirect_to request.referrer || root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end

end
