Rails.application.routes.draw do

  get 'react' => 'react#index'

  resources :authentications, only: :create

  devise_for :identities, controllers: {
    sessions:      'sessions',
    registrations: 'registrations'
  }

  root 'pages#home'
end
