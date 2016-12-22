Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers: {registrations: "registrations"}
  root "static_pages#index"
  resources :club_requests
  resources :events, only: :show
  resources :likes, only: [:create, :destroy]
  resources :user_events, only: [:create, :destroy]
  resources :ratings, only: :create
  resources :user_clubs, only: [:create, :destroy, :update]
  resources :club_member
  resources :users
  resources :albums, only: [:index, :show]
  resources :images

  namespace :management do
    resources :events
    resources :albums
    resources :user_clubs
  end
  namespace :admin do
    resources :club_requests
    resources :clubs
    resources :organizations
  end
  resources :organizations, only: :show
end
