class BookEvent
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title

end
