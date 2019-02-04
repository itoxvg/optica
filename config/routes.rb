Rails.application.routes.draw do
  resources :productos, except: [:destroy]
  root 'homes#index'
end
