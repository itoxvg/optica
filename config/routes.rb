Rails.application.routes.draw do
  devise_for :usuarios

  resources :armazones
  resources :lentes
  resources :micas
  resources :usuarios, except: [:destroy]

  root 'homes#index'
end
