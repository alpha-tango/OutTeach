Rails.application.routes.draw do

  root "home#index"

  devise_for :users
  resources :users, only: [:show]

  resources :courses do
    resources :quizzes, only: [:new, :create]
    resources :assignments, only: [:new, :create, :index]
  end

  resources :assignments, only: [:destroy, :edit, :update, :show] do
    resources :elements, only: [:new, :create, :index, :show]
  end

  resources :elements, only: [:destroy, :edit, :update]

  resources :quizzes, only: [:show, :edit, :update] do
    resources :questions, only: [:new, :create, :index]
  end

  namespace :admin do
    resources :users, only: [:index, :destroy]
  end
end
