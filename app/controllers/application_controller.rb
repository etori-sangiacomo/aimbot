class ApplicationController < ActionController::API
  before_action :validate_token

  def healthcheck
    render json: { msg: 'Zod!' }, status: 200
  end

  private

  def validate_token
    token = request.headers['Aimbot'] || params[:token]

    if token != ENV['API_SECRET']
      render json: { errors: 'Token inválida' }, status: :unauthorized
    end
  end
end
