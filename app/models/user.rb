class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :posts
  has_many :comments
  has_many :authored_posts, :class_name => "Post", :foreign_key => :author_id
  has_many :commented_posts, :through => :comments, :source => :post
  validates_presence_of :name
  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: "Regular" if self.role.nil?
  end
  
end
