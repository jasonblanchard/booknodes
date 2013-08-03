class Idea
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :note
  field :nodes, type: Array
  embedded_in :book_event

  def list_nodes
    nodes.join(', ')
  end

end
