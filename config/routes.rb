Rails.application.routes.draw do
  # Api definition
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, except: [:create]
      resources :requests
      resources :fulfill_request, only: [:update]
      post 'auth/signup', to: 'users#create'
      post 'auth/login', to: 'authentication#login'
    end
  end
end
