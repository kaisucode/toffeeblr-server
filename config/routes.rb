Rails.application.routes.draw do
  resources :users
  resources :posts
  resources :usernames
  resources :relationships
 
  get '/feed', to: 'users#feed'
  get '/explore', to: 'posts#explore'
  get '/auth/self', to: 'authentication#self'
  post '/auth/login', to: 'authentication#login'
end
