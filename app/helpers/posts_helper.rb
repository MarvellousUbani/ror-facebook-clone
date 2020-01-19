# frozen_string_literal: true

module PostsHelper
  def liked?(post_id)
    current_user.likes.exists?(post_id: post_id)
  end

   # Gets Like Id of a particular post liked by a current user
   def current_user_liked(post_id)
   	 current_user.likes.find_by(post_id:post_id).id
   end
end
