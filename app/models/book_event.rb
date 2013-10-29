class BookEvent
  include Mongoid::Document
  include Mongoid::Timestamps
  include Ideaable

  field :title
  belongs_to :user

end
