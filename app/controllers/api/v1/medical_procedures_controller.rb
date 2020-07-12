class Api::V1::MedicalProceduresController < Api::V1::BaseController
  include ::Api::V1::MedicalProceduresHelper

  before_action :validate_query_param_presence, only: [:search]
  before_action :validate_page_param_presence, only: [:search]
  before_action :validate_page_param_type, only: [:search]

  # All parameters must be passed to this method, otherwise bad request would be raised
  def search
    render json: ::Queries::Medical::ProcedurePages.fetch(page: params[:p]).search(params[:q])
  end
end
