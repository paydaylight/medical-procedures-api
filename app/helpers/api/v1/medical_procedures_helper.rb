module Api::V1::MedicalProceduresHelper
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