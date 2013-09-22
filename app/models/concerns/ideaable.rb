module Ideaable
  extend ActiveSupport::Concern

  included do
    embeds_many :ideas
    index "ideas.nodes" => 1
  end

end
