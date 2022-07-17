Rails.application.routes.draw do
  root 'events#upcoming_events'
  get '/past_events', to: "events#past_events"

  devise_for :users

  resources :events do 
    resources :participants, only: [:create, :destroy]
  end
end
