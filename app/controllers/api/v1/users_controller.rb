class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def new
  end

  def create
  end

  def edit
  end

  def udpate
  end

  def destroy
  end

  private

  helper_method :set_user

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(
        :username,
        :email,
        :password,
        :image
        )
    end

end
