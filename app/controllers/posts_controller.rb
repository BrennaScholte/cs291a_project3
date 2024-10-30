class PostsController < ApplicationController
  def index
    @posts = Post.all
    @current_user = User.find_by(id: session[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @current_user = User.find_by(id: session[:user_id])
    # TODO: figure out which to use
    @post = Post.new
    @post = @user.posts.create(post_params) 
    # TODO: redirect to ?
  end

  private
    def post_params
      params.require(:post).permit(:body, :username, :num_comments, :user_id)
    end

end

