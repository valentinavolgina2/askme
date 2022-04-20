Rails.application.routes.draw do
  resources :questions
  patch '/questions/:id/hide', to: 'questions#hide'
  root to: 'questions#index'
end
