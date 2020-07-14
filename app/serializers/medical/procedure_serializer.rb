class Medical::ProcedureSerializer < ActiveModel::Serializer
  attributes :id, :name, :linked

  def linked
    if @instance_options[:preloader] && @instance_options[:preloader].is_a?(Services::Medical::ProcedureChildren)
      p 'here'
      children = @instance_options[:preloader].for(object.id)
    else
      children = object.children.limit(5)
    end
    ActiveModelSerializers::SerializableResource.new(children, each_serializer: Medical::ProcedureSerializer).as_json
  end
end
