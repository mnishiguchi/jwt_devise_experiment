Rails.application.routes.draw do

  post 'identity_token' => 'identity_token#create'

  get 'react'           => 'react#index'

  devise_for :identities, controllers: {
    sessions:      'sessions',
    registrations: 'registrations'
  }

  root 'pages#home'
end
