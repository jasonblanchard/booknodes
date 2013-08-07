class Idea
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :note
  field :nodes, type: Array
  field :page, type: Integer
  embedded_in :book_event

  def list_nodes
    nodes.join(', ') unless nodes.nil?
  end

  def self.split_node_string(nodes)
    nodes.split(',').map { |v| v.strip }
  end

  def self.split_nodes_from_note(string)
    string.scan(/{(.*?)}/).flatten
  end

  def self.remove_node_delimiter(string)
    string.gsub(/{|}/, '')
  end

end
