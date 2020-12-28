Rails.application.routes.draw do
  # Api definition
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, except: [:create]
      resources :requests
      resources :messages
      resources :fulfill_request, only: [:update]
      post 'auth/signup', to: 'users#create'
      post 'auth/login', to: 'authentication#login'
      get 'requests/volunters/:id', to: 'requests#volunters'
    end
  end
  mount ActionCable.server => '/cable'
end
