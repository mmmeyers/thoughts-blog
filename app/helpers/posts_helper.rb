module PostsHelper

  def last_updated(post)
    post.updated_at.strftime("Last updated on %A, %B %d, %Y %l:%M %p %Z")
  end

end
