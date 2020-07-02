Rails.application.routes.draw do
  resources :follows
  resources :users
  get 'console', to: 'users#console'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
