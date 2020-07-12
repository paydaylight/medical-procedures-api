module Api::V1::MedicalProceduresHelper
  ## Params validation methods for /search route

  def validate_query_param_presence
    raise ActionController::BadRequest.new("Query parameter 'q' must be present") if params[:q].blank?
  end

  def validate_page_param_presence
    raise ActionController::BadRequest.new("Page parameter 'p' must be present") if params[:p].blank?
  end

  # Use Integer() instead of :to_i because the last is not a strict conversion and would pass gibberish strings
  def validate_page_param_type
    Integer(params[:p])
  rescue
    raise ActionController::BadRequest.new("Parameter 'p' must be integer")
  end
end