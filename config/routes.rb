Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get '/users/:id' => 'users/sessions#show'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :events
  resources :attended_events, only: [ 'new', 'create' ]

  # Defines the root path route ("/")
  root "events#index"
end
