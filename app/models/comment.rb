class Comment < ActiveRecord::Base
  belongs_to :post, counter_cache: true
  belongs_to :user
  validates :content, presence: true
end
