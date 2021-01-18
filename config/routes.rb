Rails.application.routes.draw do
  resources :teachers, only: %i[index create]
  resources :courses, only: %i[index create]
  resources :classrooms, only: %i[create], param: 'classroom_id' do
    member do
      post 'registration'
      patch 'assign'
    end
  end

end
