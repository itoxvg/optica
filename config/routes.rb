Rails.application.routes.draw do
  devise_for :usuarios

  namespace :api, defaults: { format: :json } do
    resources :productos, only: :index
  end

  resources :armazones
  resources :lentes
  resources :micas
  resources :vendedores, except: [:destroy]
  resources :ventas

  root 'homes#index'
end
