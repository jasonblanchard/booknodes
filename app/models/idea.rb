class Idea
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :note
  field :nodes, type: Array
  field :page, type: Integer
  embedded_in :book_event

  def list_nodes
    nodes.join(', ') unless nodes.nil?
  end

end
