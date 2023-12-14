Rails.application.routes.draw do
  
  namespace :site do
    get 'welcome/index'
  end
  namespace :users_backoffice do
    get 'welcome/index'
    get 'profile', to: 'profile#edit'
    patch 'profile', to: 'profile#update'
    resources :users
    resources :trainings
    resources :events
    resources :exams
    resources :frequencies
    resources :shoppings
    resources :products
    resources :payments
  end
  namespace :admins_backoffice do
    get 'welcome/index' #Dashboard
    resources :admins #Administradores
    resources :subjects #Assuntos/Áreas
    resources :questions #Perguntas
  end
  
  devise_for :admins
  devise_for :users
  
  get 'inicio', to: 'site/welcome#index'

  root to: 'site/welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
