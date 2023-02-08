Rails.application.routes.draw do
  
  get "/me", to: "users#create"
  get "/signup", to: "users#show"
  get '/login', to: "sessions#create"
  get "/logout", to: "sessions#destroy"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
