Rails.application.routes.draw do
  root 'events#index'
  devise_for :users
  resources :events do 
    resources :participants, only: [:create, :destroy]
  end
end
