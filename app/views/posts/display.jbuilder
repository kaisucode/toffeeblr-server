
json.array! @posts do |post|
  json.merge! post.attributes
  json.username post.username
end

