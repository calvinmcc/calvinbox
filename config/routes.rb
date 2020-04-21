Rails.application.routes.draw do

  get 'quizzes/questions'
  get 'home/index'
  root 'home#index'
  
  resources :users do
    resources :quizzes
  end

  namespace :admin do
    root 'users#index'
    resources :users
    resources :quizzes
    resources :questions
    post 'quizzes/update_section_numbers', to: 'quizzes#update_section_numbers', as: 'update_section_numbers'
    post 'users/update_quizzes', to: 'users#update_quizzes', as: 'update_quizzes'
  end

  post 'users/vote', to: 'users#vote', as: 'vote'

  resources :questions
  resources :quizzes
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
