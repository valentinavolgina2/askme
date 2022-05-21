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

  match '/403' => 'errors#not_authorized', via: :all, as: :not_authorized
  match '/404' => 'errors#not_found', via: :all, as: :not_found
  match '/422' => 'errors#unprocessable_entity', via: :all, as: :unprocessable_entity
  match '/500' => 'errors#internal_server_error', via: :all, as: :internal_server_error

  root to: 'questions#index'
end
