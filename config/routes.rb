Rails.application.routes.draw do
  # Dashboard route
  get "dashboard", to: "dashboard#index", as: :dashboard
  
  # Language switching
  get "language/switch", to: "language#switch", as: :switch_language
  
  # User resources with nested loans for new/create
  resources :users do
    resources :loans, only: [:new, :create]
  end
  
  # Other resources
  resources :payments
  resources :date_payments
  resources :loans, except: [:new, :create]

  # Root path
  root "dashboard#index"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
