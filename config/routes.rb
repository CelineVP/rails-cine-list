Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "lists#index"
  resources :lists, only: [:create, :new, :index, :destroy, :show] do
    resources :bookmarks, only: [:new, :create]
  end

  resources :movies, only: [:index, :new, :show]
  resources :bookmarks, only: :destroy
end
