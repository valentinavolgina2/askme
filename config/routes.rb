Rails.application.routes.draw do
  resources :questions do
    member do
      patch 'hide'
    end
  end

  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create edit update destroy]

  root to: 'questions#index'
end
