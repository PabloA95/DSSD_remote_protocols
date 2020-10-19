Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :users, only: [:create]
  get "test", to: "users#test"
  post "/login", to: "users#login"
  post "/users", to: "users#create"
  get "/users", to: "users#index"
  get "auto_login", to: "users#auto_login"

  get "/protocols", to: "protocols#index"
  get "/protocols/:id", to:"protocols#show"
  post "/protocols", to:"protocols#create"
end
