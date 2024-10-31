class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @current_post = Post.find_by(id: params[:id])

    @comment = @current_post.comments.build(post_params)
    @comment.user_id = session[:user_id]

    if @comment.save
      redirect_to post_path(@current_post)

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
