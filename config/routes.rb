Rails.application.routes.draw do
  resources :users
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/user_details', to: 'users#details'
  resources :health_policies
  resources :documents
end
