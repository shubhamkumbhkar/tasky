Rails.application.routes.draw do
  get 'tasks/index'
  root to: 'home#index'
  devise_for :users

  
  resources :projects do
    resources :comments, module: :projects
    resources :tasks do
      resources :comments, module: :tasks
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
