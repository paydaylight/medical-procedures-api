class Services::Medical::ProcedureChildren
  def initialize(collection)
    @collection = collection
  end

  def for(parent_id = nil)
    @collection.select do |node|
      parent_id ? (node.ancestry && node.ancestry.match(/#{parent_id}$/)) : node.ancestry.nil?
    end
  end
end