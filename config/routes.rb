Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  root "static_pages#index"
  resources :club_requests
  resources :events, only: :show
  resources :ratings, only: :create
  resources :user_clubs, only: [:create, :destroy, :update]
  resources :club_member
  namespace :management do
    resources :events
  end
  namespace :admin do
    resources :clubs
  end
end
