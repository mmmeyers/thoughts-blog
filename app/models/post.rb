class Post < ActiveRecord::Base
  belongs_to :user
  has_many :tags, :through => :post_tags
  has_many :post_tags
  has_many :comments
  has_many :commentors, :through => :comments
  validates :title, :content, presence: true


  def self.by_user(user_id)
    where(:user => user_id)
  end

end
