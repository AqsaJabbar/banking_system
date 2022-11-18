Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  devise_for :users, controllers:{
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  namespace :admin do
    resources :banks do
    member do
      get :sub
    end
  end
    resources :users
  end
  resources :accounts do
    member do
      get :approve
    end
    resources :transactions
  end
  root 'home#index' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
