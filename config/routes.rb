Rails.application.routes.draw do
  resources :users
  resources :posts
  resources :usernames
 
  get '/feed', to: 'users#feed'
  get '/explore', to: 'posts#explore'
  post '/auth/login', to: 'authentication#login'
end
