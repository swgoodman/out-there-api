class Api::V1::SessionsController < ApplicationController

  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      session[:user_id] = @user.id
      # SEND USER JSON
    else
      render :new
    end
  end

end
