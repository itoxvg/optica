Rails.application.routes.draw do
  devise_for :usuarios

  resources :armazones
  resources :lentes
  resources :micas
  resources :vendedores, except: [:destroy]

  root 'homes#index'
end
