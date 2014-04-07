class BookEvent
  include Mongoid::Document
  include Mongoid::Timestamps
  include Ideaable

  field :title
  belongs_to :user
  embeds_many :breakdowns

  scope :recent, lambda { order_by(:created_at => :desc) }

end
