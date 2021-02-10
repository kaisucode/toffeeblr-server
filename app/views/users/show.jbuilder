
json.user do 
  json.merge! @user.attributes.except("password_digest")

  json.followers @user.followers.map { |user| user.username }
  json.following @user.following.map { |user| user.username }
  json.likes @user.likes.order(created_at: :desc).map{ |like| like.post_id }

  json.posts do
    json.partial! '/posts', posts: @user.posts, current_user: @current_user
  end
end

