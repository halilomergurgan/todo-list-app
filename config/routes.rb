Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :todos do
    member do
      get 'delete'
      get 'complete'
      get 'revert'
    end
    collection do
      get 'filter'
    end
  end
end
