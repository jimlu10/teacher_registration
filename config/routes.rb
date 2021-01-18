Rails.application.routes.draw do
  resources :teachers, only: %i[index create]
  resources :courses, only: %i[index create]
  resource :classrooms, only: %i[create]

end
