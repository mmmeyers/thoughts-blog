module CommentsHelper

  def last_updated(comment)
    comment.updated_at.strftime("Last updated on %A, %B %d, %Y %l:%M %p")
  end

end
