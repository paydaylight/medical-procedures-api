class Api::V1::MedicalProceduresController < Api::V1::BaseController
  before_action :validate_query_param_presence, only: [:search]
  before_action :validate_page_param_presence, only: [:search]
  before_action :validate_page_param_type, only: [:search]

  def search
    render json: ::Queries::Medical::ProcedurePages.fetch(page: params[:p]).search(params[:q])
  end

  def search2
    return render json: [] if params[:q].blank?

    if params[:p].present?
      relation = ::Queries::Medical::ProcedurePages.fetch(page: params[:p])
    else
      relation = Medical::Procedure
    end

    render json: relation.search(params[:q])
  end

  private
  def validate_query_param_presence
    raise ActionController::BadRequest.new("Query parameter 'q' must be present") if params[:q].blank?
  end

  def validate_page_param_presence
    raise ActionController::BadRequest.new("Page parameter 'p' must be present") if params[:p].blank?
  end

  def validate_page_param_type
    Integer(params[:p])
  rescue
    raise ActionController::BadRequest.new("Parameter 'p' must be integer")
  end
end
