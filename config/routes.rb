Rails.application.routes.draw do
  resources :uploads
  resources :projects
  resources :cities
  resources :categories
  root to: 'cities#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
  resources :events
  post 'uploads/upload', to: 'uploads#upload'
  get 'projects/:id/participate', to: 'projects#participate'
  get 'projects/:id/approve/:participant_id', to: 'projects#approve'
  get 'projects/:id/decline/:participant_id', to: 'projects#decline'
  
end
