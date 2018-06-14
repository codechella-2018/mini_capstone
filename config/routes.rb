Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  namespace :api do
    get '/products' => 'products#index'
    get '/products/:id' => 'products#show'
    post '/products' => 'products#create'
    patch '/products/:id' => 'products#update'
    delete '/products/:id' => 'products#destroy'

    get '/orders/:id' => 'orders#show'
    post '/orders' => 'orders#create'
  end
  post "/users" => "users#create"

end