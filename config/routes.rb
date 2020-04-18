Rails.application.routes.draw do
  get 'quizzes/questions'
  get 'home/index'
  root 'home#index'
  
  resources :users do
    resources :quizzes
  end

  
  resources :questions
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
