class Api::V1::UsersController < ApplicationController
  def create
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id
      render json: { current: user }
    else
      render json: { error: 'Failed to Sign Up' }, status: 400
    end
  end

  def login
    user = User.find_by(username: params[:user][:username])

    if user && user.authenticate(params[:user][:password])
      render json: { current: user }
    else
      render json: { error: 'Failed to Log In' }, status: 400
    end
  end

  def show
    render json: current_user
  end

  private

  def user_params
    params.require(:user).permit(
        :username,
        :email,
        :password,
        :password_confirmation
      )
  end
end
