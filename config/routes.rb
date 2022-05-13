Rails.application.routes.draw do
  get '/questions/search', to: 'questions#search', as: 'search', param: :tag

  resources :questions do
    member do
      patch 'hide'
    end
  end

  resource :session, only: %i[new create destroy]
  resources :users, param: :nickname, except: %i[index]
  resources :settings

  root to: 'questions#index'
end
