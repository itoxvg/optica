Rails.application.routes.draw do
  devise_for :usuarios

  namespace :api do
    resources :boletos, only: [] do
      get :ventas, on: :member
    end
    resources :clientes, only: :index
    resources :productos, only: :index
  end

  resources :armazones
  resources :clientes, except: [:destroy]
  resources :empresas
  resources :lentes
  resources :micas
  resources :tratamientos
  resources :vendedores, except: [:destroy]
  resources :ventas

  root 'homes#index'
end
