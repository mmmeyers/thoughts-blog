module PostsHelper

  def last_updated(post)
    post.updated_at.strftime("Last updated on %A, %b, %e, at %I:%M %p %Z")
  end

end
