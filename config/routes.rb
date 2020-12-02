Rails.application.routes.draw do
  resources :books do
    collection { post :import }
  end
  get 'pages/home'
  devise_for :users
  root to: "students#home"
  resources :students
  get 'search', to: "books#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
