class BreakdownSerializer < ActiveModel::Serializer
  attributes :id, :nodes, :note

  def id
    object.id.to_s
  end
end
