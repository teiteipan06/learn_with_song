Rails.application.routes.draw do
  devise_for :users
  root "songs#index"

  resources :users, only: [:show,:index,:edit,:update] 
  resources :songs do
    collection do
      get 'search'
    end
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
end
