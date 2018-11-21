class Api::V1::UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy]


  def index
    render json: { success: "ok", status: 200 }
  end

  def new
    render json: { success: "ok", status: 200 }
  end

  def create
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id
      # send USER INFO JSON
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
  end

  def udpate
    @user = User.find_by(id: params[:id])

    if @user.update(user_params)
      # send USER INFO JSON
    else
      render :edit
    end
  end

  def destroy
  end

  # private
  #
  # helper_method :set_user
  #
  #   def set_user
  #     @user = User.find(params[:id])
  #   end
  #
  #   def user_params
  #     params.require(:user).permit(
  #       :username,
  #       :email,
  #       :password,
  #       :image
  #       )
  #   end

end
