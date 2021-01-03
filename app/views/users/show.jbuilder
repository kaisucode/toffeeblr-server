
json.user do 
  json.merge! @user.attributes.except("password_digest")
  json.posts @user.posts do |post|
    json.merge! post.attributes
    json.username post.username
  end
end

