class Api::V1::SessionsController < ApplicationController
  
  # Create new session
  def create
    @user = User.create(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      binding.pry
      render json: { current: user }
    else
      render json: { error: 'Failed to Sign Up' }, status: 400
    end
  end

  # Set current user
  def login
    @user = User.find_by(username: params[:user][:username])
    if @user
      render json: { current: user }
    else
      render json: { error: 'Failed to Log In' }, status: 400
    end
  end

  # Show user info page
  def show
    render json: current_user
  end

  private

  # Acceptable session params
  def user_params
    params.require(:user).permit(
        :username,
        :email,
        :password,
        :password_confirmation
      )
  end
end
