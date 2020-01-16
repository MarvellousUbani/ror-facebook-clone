# frozen_string_literal: true

module PostsHelper
  def liked?(_post_id)
    current_user.likes.exists?(post_id: post.id)
   end
end
