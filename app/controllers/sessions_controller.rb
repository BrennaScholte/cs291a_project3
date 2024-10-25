class SessionsController < ApplicationController
  def index
    @session = Session.new
  end

  def show
    @sessions = Session.all
    # @session = Session.new
  end

  def new
    @session = Session.new
  end

  def create
    puts params.inspect
    @session = Session.new(session_params)

    if @session.save
      redirect_to @session # redirect to root, which displays posts
    else
      render :new, status: :unprocessable_entity # Return error
    end
  end

  private
    def session_params
      params.require(:session).permit(:username)
    end
end
