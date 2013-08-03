class Idea
  include Mongoid::Document
  
  field :note
  field :nodes, type: Array
  embedded_in :book_event

end
