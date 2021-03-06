class Idea
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  field :note
  field :nodes, type: Array
  field :page, type: Integer
  embedded_in :book_event

  validates :page, numericality: { only_integer: true, :allow_nil => true }

  scope :with_node, lambda { |node| where :nodes => node }
  scope :recent, lambda { order_by(:created_at => :desc) }
  
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

  def self.split_nodes_from_note(string)
    nodes_from_curly_bracket(string) + nodes_from_hashtag(string)
  end

  def self.remove_node_delimiter(string)
    string.gsub(/{|}/, '').gsub(/#/, '')
  end

  private

  def self.nodes_from_curly_bracket(string)
    string.scan(/{(.*?)}/).flatten.map { |v| v.strip.downcase }
  end

  def self.nodes_from_hashtag(string)
    string.scan(/#(\w+)/).flatten.map { |v| v.strip.downcase }
  end

end
