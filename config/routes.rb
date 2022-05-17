Rails.application.routes.draw do
  resources :questions do
    get :search, on: :collection, param: :tag
    member do
      patch :hide
    end
  end

  resource :session, only: %i[new create destroy]
  resources :users, param: :nickname, except: %i[index]
  resources :settings

  root to: 'questions#index'
end
