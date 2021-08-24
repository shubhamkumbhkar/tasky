Rails.application.routes.draw do
  get 'tasks/index'
  root to: 'home#index'
  devise_for :users

  
  resources :projects do
    resources :tasks
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
