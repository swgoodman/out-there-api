class Api::V1::BoardsController < ApplicationController

  def index
    render json: { success: "ok", status: 200 }
  end

end
