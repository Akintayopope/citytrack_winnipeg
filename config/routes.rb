Rails.application.routes.draw do
  # Resourceful routes for all models
  resources :wards
  resources :service_requests
  resources :expense_reports
  resources :events

  # Static pages
  get "pages/home"
  get "pages/about"
  get "about", to: "pages#about"

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Root route
  root "pages#home"
end
