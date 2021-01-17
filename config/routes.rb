Rails.application.routes.draw do
  resources :teachers, only: [:index]
end
