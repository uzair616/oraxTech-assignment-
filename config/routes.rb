Rails.application.routes.draw do
  root 'posts#index'
  resources :posts do
    resources :comments
  end
  resources :users,only: [:new,:create]
  get 'login'     ,to: 'sessions#new'
  post 'login'    ,to: 'sessions#create'
  delete 'logout' ,to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
