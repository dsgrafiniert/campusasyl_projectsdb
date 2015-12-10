Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations=> "users/registrations" }
  
  scope "(:locale)", :locale => /en|de|ar/ do
    resources :uploads
    resources :projects
    resources :cities
    resources :categories
    resources :event_occurrences
    root to: 'cities#index'
    resources :events
    post 'uploads/upload', to: 'uploads#upload'
    get 'projects/:id/participate', to: 'projects#participate'
    get 'projects/:id/find_participants', to: 'projects#find_participants'
    get '/projects/:id/invite/#participant_id', to: 'projects#invite'
    get 'projects/:id/approve/:participant_id', to: 'projects#approve'
    get 'projects/:id/decline/:participant_id', to: 'projects#decline'
    get 'cities/:id/participate', to: 'cities#participate'
  
    get 'cities/:id/invite/:invitationHash', to: 'cities#invite'
    get 'event_occurrences/:id/attend', to: 'event_occurrences#attend'
    get 'event_occurrences/:id/decline', to: 'event_occurrences#decline'
    get 'my/event_occurrences', to: 'event_occurrences#mine'
    
    resources :users
  end
end
