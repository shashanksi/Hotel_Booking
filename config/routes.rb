Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#homepage"

  resources :bookings
  resources :properties do 
    member do 
      get :bookings
    end
  end

  get 'pastbookings', to: 'bookings#past_booking'
  get 'futurebookings', to: 'bookings#future_booking'
end
