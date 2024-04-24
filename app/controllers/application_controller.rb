# app/controllers/application_controller.rb
class ApplicationController < ActionController::API
  # before_action :authenticate_request

  def current_user
    @current_user
  end

  private

  def authenticate_request
    token = params[:token]
    if token
      decoded_token = decode_token(token)
      @current_user = User.find(decoded_token) if decoded_token
    end

    unless @current_user
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def decode_token(token)
    JWT.decode(token, nil, false).first
  rescue JWT::DecodeError
    nil
  end
end