class Medical::ProcedureSerializer < ActiveModel::Serializer
  attributes :id, :name, :linked

  def linked
    ActiveModelSerializers::SerializableResource.new(object.children, each_serializer: Medical::ProcedureSerializer).as_json
  end
end
