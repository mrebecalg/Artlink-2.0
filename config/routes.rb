Rails.application.routes.draw do
  devise_for :users, path: 'users'

  devise_for :artists, skip: [:passwords], controllers: { sessions: 'artists/sessions' }

  get "pages/profile"
  resources :publications, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "pages#homepage"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get 'pages/profile', to: 'pages#profile'

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :admin do
    resources :dashboard, only: [:index] # Solo para ejemplo
  end
end
