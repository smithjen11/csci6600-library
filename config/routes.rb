Rails.application.routes.draw do
  resources :users, except: [:destroy, :show, :new, :create]
  resources :user_books
  get 'books/search', to: 'books#search', as: 'search'
  post 'books/search', to: 'books#search', as: 'search_query'

  resources :holds
  resources :loans
  resources :books
  devise_for :users
  get 'welcome/index', to: 'welcome#index', as: 'home'
  get 'welcome/dashboard', to: 'welcome#dashboard', as: 'dashboard'
  get 'welcome/admin', to: 'welcome#admin', as: 'admin'

  root to: 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
