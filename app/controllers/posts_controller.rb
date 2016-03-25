class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    respond_to do |format|
      format.html{ redirect_to post_path(@post) }
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :desc)
  end

  def edit
    @post = Post.find(params[:post_id])
  end

  def update
    @post = Post.find(params[:post_id])
    @post.update(post_params)
    respond_to do |format|
      format.html{ redirect_to post_path(@post) }
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.destroy
    respond_to do |format|
      format.html{ redirect_to posts_path }
    end
  end

  def like
    @post = Post.find(params[:id])
    current_user.like!(@post)
    respond_to do |format|
      format.html{ redirect_to :back}
      format.js{}
    end
  end

  def unlike
    @post = Post.find(params[:id])
    current_user.unlike!(@post)
    respond_to do |format|
      format.html{ redirect_to :back}
      format.js{}
    end
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

  private
    def post_params
      params.require(:post).permit(:image,:content)
    end


end
