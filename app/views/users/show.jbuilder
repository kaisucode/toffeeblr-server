
json.user do 
  json.merge! @user.attributes.except("password_digest")

  json.followers @user.followers.map { |user| user.username }
  json.following @user.following.map { |user| user.username }
  json.likes @user.likes.order(created_at: :desc).map{ |like| like.post_id }

  json.posts @user.posts do |post|
    json.merge! post.attributes
    json.username post.username
    json.likes post.likes
  end
end

