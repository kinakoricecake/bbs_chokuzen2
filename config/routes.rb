Rails.application.routes.draw do
  root 'homes#top'
  get 'login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #resources :posts, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :posts, except: [:show]
  resources :users do
    collection do
      get 'search'
    end
  end
end
