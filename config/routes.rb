Rails.application.routes.draw do
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
  namespace :management do
    resources :events
  end
  namespace :admin do
    resources :clubs
    resources :organizations
  end
  resources :organizations, only: :show
end
