Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root to: 'pages#home'
  resources :users
  resources :auditions
  resources :tags
  resources :user_tags, only: [:create, :destroy]
  resources :audition_tags, only: [:create, :destroy]
end
