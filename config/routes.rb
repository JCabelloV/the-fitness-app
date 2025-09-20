Rails.application.routes.draw do
  root "pages#home"

  resources :users
  resources :trainers

  resources :scheudles do
    member do
      post :block
      post :unblock
    end
    resources :bookings, only: [ :new, :create, :show, :index ]
  end

  resources :bookings, only: [ :new, :create, :show, :index ] do
    resources :bookin_participants, only: [ :create, :destroy ]
  end

  get "mis-reservas", to: "bookings#index", as: "my_bookings"
end
