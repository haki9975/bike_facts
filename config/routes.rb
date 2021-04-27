Rails.application.routes.draw do
  root('static#home')
  resources :service_records
  resources :bikes
  get '/signup', to: 'users#new'
  post '/signup_attempt', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
