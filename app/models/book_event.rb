class BookEvent
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  belongs_to :user
  embeds_many :ideas

  def all_idea_nodes
    self.ideas.map(&:nodes).flatten.inject(Hash.new(0)) do |h,v|
      h[v] += 1
      h
    end
  end

end
