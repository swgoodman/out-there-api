class ApplicationController < ActionController::API
  def index
    render json: { message: "successful", status: 200 }
  end

  def get_current_user
    jwt_token = request.headers['HTTP_AUTHORIZATION'] # .gsub('Bearer ', '')

    if jwt_token
      user_info = Auth.decode(jwt_token)
      user ||= User.find(user_info['user_id'])
    end

    user
  end

  def get_current_board
    jwt_token = request.headers['HTTP_AUTHORIZATION'] # .gsub('Bearer ', '')

    if jwt_token
      board_info = Auth.decode(jwt_token)
      board ||= Board.find(board_info['board_id'])
    end

    user
  end
end
