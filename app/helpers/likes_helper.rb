module LikesHelper
  def user_like_reivew review
    current_user.likes.find_by review_id: review.id
  end
end
