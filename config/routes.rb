Rails.application.routes.draw do
  post 'likes/unlike'
  root to: "static_pages#home"
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  mount ActionCable.server => '/cable'
  resources :sessions,   only: [:new, :create, :destroy]
  resources :posts,  only: [:edit, :show, :create, :destroy]
  resources :subscribes, only: [:create, :destroy]
  resources :likes, only: [:create, :unlike]
  resources :chat_rooms, only: [:new, :create, :show, :index, :edit]
  resources :messages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
