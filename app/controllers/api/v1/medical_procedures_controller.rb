class Api::V1::MedicalProceduresController < Api::V1::BaseController
  def search
    render json: {msg: "OK"}
  end
end
