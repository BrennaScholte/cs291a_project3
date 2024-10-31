class PostsController < ApplicationController
  def index
    @posts = Post.all
    @current_user = User.find_by(id: session[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @current_user = User.find_by(id: session[:user_id]) # find user

    @post = @current_user.posts.build(post_params) # create post
    @post.username = @current_user.username
    @post.user_id = @current_user.id  # build automatically adds id?
    @post.num_comments = 0  # TODO: update this to actual # of comments

    # puts "Post contents: #{@post.inspect}"
    if @post.save
      redirect_to root_path
      puts "Post created successfully"
    else
      # render :new, status: :unprocessable_entity # Return error
      flash[:alert] = @post.errors.full_messages.join(", ")
      redirect_to root_path
    end
  end

  private
    def post_params
      params.require(:post).permit(:body, :username, :num_comments, :user_id)
    end

end

