class SessionsController < ApplicationController
  def index
    @session = Session.new
  end

  def show
    @current_user = User.find_by(id: session[:user_id])
  end

  def new
    @session = Session.new
  end

  def create
    user = User.find_or_create_by(username: session_params[:username])
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
    def session_params
      params.require(:session).permit(:username)
    end
end
