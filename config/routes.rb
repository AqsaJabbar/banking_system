Rails.application.routes.draw do
  devise_for :users, controllers:{
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  namespace :admin do
    resources :banks
    resources :users
  end
  resources :accounts do
    member do
      get :approve
    end
  end
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
