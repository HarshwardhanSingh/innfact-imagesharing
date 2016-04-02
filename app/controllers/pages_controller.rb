class PagesController < ApplicationController
  
  before_action :authenticate_user!, only:[:follow,:unfollow,:dashboard]

  def welcome
    if user_signed_in?
      redirect_to dashboard_path
    end
  end

  def dashboard
    @posts = Post.order(created_at: :desc)
  end

  def search
  end

  def filterByTag
    @category = Category.find_by(name: params[:tag])
    @posts = @category.posts.order(created_at: :desc)
  end

  def userpage
    @user = User.find_by(username: params[:username])
    @posts = @user.posts.order(created_at: :desc)
  end


  def follow
    @user = User.find(params[:user_id])
    current_user.follow!(@user)
    respond_to do |format|
      format.html{ redirect_to :back}
      format.js{}
    end
  end

  def unfollow
    @user = User.find(params[:user_id])
    current_user.unfollow!(@user)
    respond_to do |format|
      format.html{ redirect_to :back}
      format.js{}
    end
  end

  def followers
    @user = User.find_by(username: params[:username])
    @users = @user.followers(User)
  end

  def followings
    @user = User.find_by(username: params[:username])
    @users = @user.followees(User)
  end

end
