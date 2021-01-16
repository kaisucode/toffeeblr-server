
json.array! @posts do |post|
  store = Array.new

  cur_post = post
  while cur_post
    store.push(cur_post)
    cur_post = cur_post.parent
  end

  json.array! store do |cur_post|
    json.merge! cur_post.attributes
    json.username cur_post.username
    json.likes cur_post.likes
    json.comments cur_post.comments
    if @current_user != nil
      json.userLiked cur_post.likes.exists?(:user_id => @current_user.id)
    else
      json.userLiked false
    end
  end

end

