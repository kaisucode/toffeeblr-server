Rails.application.routes.draw do
  resources :users
  resources :posts
 
  get '/feed', to: 'users#feed'
  post '/auth/login', to: 'authentication#login'
end
