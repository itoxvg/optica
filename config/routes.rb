Rails.application.routes.draw do
  devise_for :usuarios

  namespace :api do
    resources :boletos, only: [] do
      get :ventas, on: :member
    end
    resources :clientes, only: :index
    resources :corporaciones, only: :index
    resources :productos, only: :index
    resources :ventas, only: :show
  end

  resources :administradores, except: [:destroy]
  resources :armazones
  resources :clientes, except: [:destroy]
  resources :corporaciones
  resources :lentes
  resources :marcas
  resources :micas
  resources :tiendas
  resources :tratamientos
  resources :vendedores, except: [:destroy]
  resources :ventas

  root 'homes#index'
end
