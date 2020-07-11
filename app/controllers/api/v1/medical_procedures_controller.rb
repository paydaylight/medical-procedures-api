class Api::V1::MedicalProceduresController < Api::V1::BaseController
  before_action :validate_query_param, only: [:search]

  def search
    render json: Medical::Procedure.search(params[:q])
  end

  def validate_query_param
    raise ActionController::BadRequest.new("Query string param 'q' must be present") if params[:q].blank?
  end
end
