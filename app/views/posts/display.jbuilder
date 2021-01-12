
json.array! @posts do |post|
  json.merge! post.attributes
  json.username post.username
  json.likes post.likes
  if @current_user != nil
    json.userLiked post.likes.exists?(:user_id => @current_user.id)
  else
    json.userLiked false
  end
end

