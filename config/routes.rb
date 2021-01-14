Rails.application.routes.draw do
  # Api definition
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, except: [:create, :index]
      resources :requests
      resources :messages
      resources :fulfill_request, only: [:update]
      resources :volunters
      post 'auth/signup', to: 'users#create'
      post 'auth/login', to: 'authentication#login'
      get 'requests/volunters/:id', to: 'requests#volunters'
      get 'requests_volunter_by_me', to: 'requests#volunter_by_me'
      put 'requests/republish/:id', to: 'requests#republish'
      patch 'requests/republish/:id', to: 'requests#republish'
    end
  end
  mount ActionCable.server => '/cable'
end
