class Breakdown
  include Mongoid::Document

  embedded_in :book_event
  field :nodes, type: Array
  field :note

end
