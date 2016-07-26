class Post < ActiveRecord::Base
  belongs_to :user
  has_many :tags, :through => :post_tags
  has_many :post_tags
  has_many :comments
  validates :title, :content, presence: true

  def self.by_user(user_id)
    where(:user => user_id) # use a class method for custom query functionality (not @post instance)
  end

  def tags_attributes=(tag_attributes)
    tag_attributes.values.each do |tag_attribute|
      tag = Tag.find_or_create_by(tag_attribute)
      self.tags << tag
    end
  end

  # In order for fields_for to work correctly, we need a writer for what we were trying to generate fields
  # for. This tags_attributes method will either find a tag that was already created (to choose from the
  # checkboxes) or create a new tag and add it to the list of tags.

  # Then in the PostsController, we set up post_params to expect a key of tags_attributes with a value of name.

end
