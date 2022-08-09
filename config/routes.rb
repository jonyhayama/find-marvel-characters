Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  namespace :api do
    root "home#index"

    resources :characters, only: [:index]
  end

  get '/*path', to: 'static_pages#index'
end
