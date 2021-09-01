Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  
  get '/chats', to: "chat#index"

  resources :conversations, only: [:create] do
    member do
      post :close
    end
  end
  resources :projects do
    resources :comments, module: :projects
    resources :tasks do
      resources :comments, module: :tasks
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
