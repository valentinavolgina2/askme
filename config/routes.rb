Rails.application.routes.draw do
  resources :questions do
    member do
      patch 'hide'
    end
  end

  root to: 'questions#index'
end
