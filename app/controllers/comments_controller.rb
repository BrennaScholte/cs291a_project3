class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    puts "before find"
    puts params[:post_id]
    @post = Post.find(params[:id])
    puts "after find"

    @comment = @post.comments.build(comment_params)
    @comment.user_id = session[:user_id]

    if @comment.save
      redirect_to post_path(@current_post)
    else
      puts "comment failed"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
