class BookEvent
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  embeds_many :ideas

  def all_idea_nodes
    self.ideas.map(&:nodes).flatten
  end

end
