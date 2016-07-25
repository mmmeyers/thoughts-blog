class Post < ActiveRecord::Base
  belongs_to :user
  has_many :tags, :through => :post_tags
  has_many :post_tags
  has_many :comments
  validates :title, :content, presence: true

  def self.by_user(user_id)
    where(:user => user_id)
  end

  def tags_attributes=(tag_attributes)
    tag_attributes.values.each do |tag_attribute|
      tag = Tag.find_or_create_by(tag_attribute)
      self.tags << tag
    end
  end

end
