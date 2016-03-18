class PagesController < ApplicationController

  def welcome
    if user_signed_in?
      redirect_to dashboard_path
    end
  end

  def dashboard
    # Fetch and display posts of followees and user
    @posts = Post.all
  end

  def search
  end

  def filterByTag
  end

  def timeline
    @posts = current_user.posts.order(created_at: :desc)
  end
  
end
