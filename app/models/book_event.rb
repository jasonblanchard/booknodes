class BookEvent
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  embeds_many :ideas

end
