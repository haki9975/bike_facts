Rails.application.routes.draw do
  resources :userbikes
  root('static#home')
  resources :users, only: [:new, :create]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  resources :service_records
  resources :bikes

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
