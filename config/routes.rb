Rails.application.routes.draw do
    
  resources :uploads
  resources :projects
  resources :cities
  resources :categories
  resources :event_occurrences
  root to: 'cities#index'
  resources :events
  post 'uploads/upload', to: 'uploads#upload'
  get 'projects/:id/participate', to: 'projects#participate'
  get 'projects/:id/approve/:participant_id', to: 'projects#approve'
  get 'projects/:id/decline/:participant_id', to: 'projects#decline'
  get '/cities/:id/invite/:invitationHash', to: 'cities#invite'
  get 'event_occurrences/:id/attend', to: 'event_occurrences#attend'
devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations=> "users/registrations" }
resources :users

end
