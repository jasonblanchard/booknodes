class Idea
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  
  field :note
  field :nodes, type: Array
  field :page, type: Integer
  embedded_in :book_event

  validates :page, numericality: { only_integer: true, :allow_nil => true }
  
  has_mongoid_attached_file :image,
    :storage => :s3,
    :bucket => ENV['BUCKET'],
    :s3_credentials => {
      :access_key_id => ENV['ACCESS_KEY_ID'],
      :secret_access_key => ENV['SECRET_ACCESS_KEY'],
    },
    :convert_options => { :all => '-auto-orient' },
    :styles => {
      :medium => '500x500>',
      :thumb => '100x100>'
    }

  def list_nodes
    nodes.join(', ') unless nodes.nil?
  end

  def self.split_node_string(nodes)
    nodes.split(',').map { |v| v.strip.downcase }
  end

  # TODO: Add hashtag syntax
  def self.split_nodes_from_note(string)
    string.scan(/{(.*?)}/).flatten.map { |v| v.strip.downcase }
  end

  def self.remove_node_delimiter(string)
    string.gsub(/{|}/, '')
  end

end
