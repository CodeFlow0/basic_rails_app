Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Create a user
  post '/users', to: 'users#create'
  # Create a post
  post '/posts', to: 'posts#create'
  # List all posts
  get '/posts', to: 'posts#index'
  # Update a post
  put '/posts/:id', to: 'posts#update'
  patch '/posts/:id', to: 'posts#update'
  # Delete a post
  delete '/posts/:id', to: 'posts#destroy'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
