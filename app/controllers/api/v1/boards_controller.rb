class Api::V1::BoardsController < ApplicationController

  def index
    # Receives GET Request and Responds with Group's Boards
    render json: { success: "ok", status: 200 }
  end

  def create
    # Receives POST Request and Responds with NEW List of Group Boards
  end

  def udpate
    # Receives POST Update Request and Responds with NEW List of Group Boards
  end

  def destroy
    # Receives POST Update Request and Responds with NEW List of Group Boards
  end

end
