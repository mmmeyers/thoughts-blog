class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
        can :manage, :all

    elsif user.author?
        can :read, Post
        can :create, Post
        can :update, Post do |post|
            post.try(:user) == user
        end

        can :update, Comment do |comment|
            comment.try(:user) == user
        end

        can :destroy, Comment do |comment|
            comment.try(:user) == user
        end

        can :destroy, Post do |post|
            post.try(:user) == user
        end

    elsif user.regular?
        can :read, Post

        can :update, Comment do |comment|
            comment.try(:user) == user 
        end

        can :destroy, Comment do |comment|
            comment.try(:user) == user 
        end
        end
    end
end
