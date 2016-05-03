class Affiliation < ActiveRecord::Base
  has_many :users
  validates :name, :description, presence: true
end
