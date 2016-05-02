class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
  belongs_to :role
  belongs_to :affiliation
  has_many :posts
  has_many :comments
  has_many :authored_posts, :class_name => "Post", :foreign_key => :author_id
  has_many :commented_posts, :through => :comments, :source => :post
  validates_presence_of :name
  before_save :assign_role
  before_save :assign_affiliation


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
    end
  end


  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def assign_affiliation
    self.affiliation = Affiliation.find_by name: "None" if self.affiliation.nil?
  end

  def none?
    self.affiliation.name == "None"
  end

  def trikru?
    self.affiliation.name == "Trikru"
  end

  def skaikru?
    self.affiliation.name == "Skaikru"
  end

  def floukru?
    self.affiliation.name == "Floukru"
  end

  def assign_role
    self.role = Role.find_by name: "Regular" if self.role.nil?
  end

  def admin?
    self.role.name == "Admin"
  end

  def author?
    self.role.name == "Author"
  end

  def regular?
    self.role.name == "Regular"
  end
  
end
