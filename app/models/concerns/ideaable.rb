module Ideaable
  extend ActiveSupport::Concern

  included do
    embeds_many :ideas
    index "ideas.nodes" => 1
  end

  def tallied_idea_nodes
    sort_idea_nodes
  end

  
  def last_idea_page_number
    # TODO: Refactor this to grab the last idea with a page number
    if ideas.last
      ideas.last.page.nil? ? nil : ideas.last.page
    else
      nil
    end
  end

  # TODO: Create a JSON action and route for this
  def new_page_range
    return [] if last_idea_page_number.nil?

    (last_idea_page_number..last_idea_page_number + 20).to_a
  end

  def idea_nodes
    ideas.map(&:nodes).flatten.uniq
  end

  private

  def get_all_idea_nodes_with_count
    ideas.map(&:nodes).flatten.compact.inject(Hash.new(0)) do |h,v|
      h[v] += 1
      h
    end
  end

  def sort_idea_nodes
    Hash[*get_all_idea_nodes_with_count.sort_by { |k,v| k }.flatten]
  end



end
