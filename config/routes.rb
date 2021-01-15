Rails.application.routes.draw do
  resources :users
  resources :posts do
    resources :likes
    resources :comments
  end
  resources :usernames
  resources :relationships
 
  get '/feed', to: 'users#feed'
  get '/explore', to: 'posts#explore'
  post '/someposts', to: 'posts#someposts'
  get '/auth/self', to: 'authentication#self'
  post '/auth/login', to: 'authentication#login'
  get '/posts/:post_id/like', to: 'likes#like'
  get '/posts/:post_id/unlike', to: 'likes#unlike'
end
