Rails.application.routes.draw do
  # Api definition
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, except: [:create]
      post 'auth/signup', to: 'users#create'
      post 'auth/login', to: 'authentication#login'
    end
  end
end
