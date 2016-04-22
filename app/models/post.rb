class Post < ActiveRecord::Base
  belongs_to :user
  has_many :tags, :through => :post_tags
  has_many :post_tags
  has_many :comments
  has_many :commentors, :through => :comments
end
