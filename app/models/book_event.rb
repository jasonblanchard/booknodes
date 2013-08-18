class BookEvent
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  belongs_to :user
  embeds_many :ideas
  index "ideas.nodes" => 1

  def all_idea_nodes
    sorted_idea_nodes
  end

  private

  def get_all_idea_nodes_with_count
    self.ideas.map(&:nodes).flatten.compact.inject(Hash.new(0)) do |h,v|
      h[v] += 1
      h
    end
  end

  def sorted_idea_nodes
    Hash[*get_all_idea_nodes_with_count.sort_by { |k,v| k }.flatten]
  end


end
