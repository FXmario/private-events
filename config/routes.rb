Rails.application.routes.draw do
  root 'events#upcoming_events'

  get '/past_events', to: "events#past_events"
  get '/attended_events', to: "events#attended_events"
  get '/created_events', to: "events#created_events"

  devise_for :users

  resources :events do 
    resources :participants, only: [:create, :destroy]
  end
end
