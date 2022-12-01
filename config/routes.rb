Rails.application.routes.draw do
  devise_for :users
  root "songs#index"

  resources :users, only: :show
  resources :songs do
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
    #post 'like/:id' => 'likes#create', as: 'create_like'
    #delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  end
end
