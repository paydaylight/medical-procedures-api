class Api::V1::BaseController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::BadRequest, with: :bad_request

  def bad_request(msg = 'Bad request')
    render json: { code: 400, message: msg }, status: 400
  end

  def not_found(msg = 'Not found')
    render json: { code: 404, message: msg }, status: 404
  end
end
