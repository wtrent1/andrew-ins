Rails.application.routes.draw do
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  resources :contacts, only: :create
  get 'get-a-quote', to: 'contacts#new', as: 'quotes'
end
