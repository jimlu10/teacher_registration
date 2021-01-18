Rails.application.routes.draw do
  resources :teachers, only: [:index, :create]
  resources :courses, only: [:create]
end
