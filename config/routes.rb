Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  root "static_pages#index"
  resources :club_requests
  namespace :management do
    resources :events
  end
  namespace :admin do
    resources :clubs
  end
  resources :users
  namespace :admin do
    resources :organizations
  end
  resources :organizations, only: :show
end
