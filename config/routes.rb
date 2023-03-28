Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "groups#index"

  resources :groups do
    resources :workers do
      resources :phones
    end
  end

  resources :workers do
    resources :phones
  end

  resources :phones

  resources :users

  resources :sessions
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  

end
