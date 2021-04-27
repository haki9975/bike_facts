Rails.application.routes.draw do
  resources :service_records
  resources :bikes
  get '/signup', to: 'user#new'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
