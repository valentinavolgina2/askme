Rails.application.routes.draw do
  resources :questions do
    member do
      patch 'hide'
    end
  end

  resource :session, only: %i[new create destroy]
  resources :users, except: %i[index]
  resources :settings

  root to: 'questions#index'
end
