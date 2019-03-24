class Api::V1::UsersController < ApplicationController
  
  # Create new user
  def create
    user = User.create(user_params)
    user.save
    
    if user
      jwt = Auth.encrypt({ user_id: user.id })
      render json: { jwt: jwt, current: user }
    else
      render json: { error: 'Failed to Sign Up' }, status: 400
    end
  end

  # Login user and set current
  def login
    user = User.find_by(username: params[:user][:username])

    if user && user.authenticate(params[:user][:password])
      jwt = Auth.encrypt({ user_id: user.id })
      render json: { jwt: jwt, current: user }
    else
      render json: { error: 'Failed to Log In' }, status: 400
    end
  end

  # Show current user
  def show
    render json: get_current_user
  end

  private

  # Acceptable user params
  def user_params
    params.require(:user).permit(
        :username,
        :email,
        :password,
        :password_confirmation
      )
  end
end
