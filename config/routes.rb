Rails.application.routes.draw do
  devise_for :usuarios

  resources :productos, except: [:destroy]
  resources :usuarios, except: [:destroy]

  root 'homes#index'
end
