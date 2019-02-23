Rails.application.routes.draw do
  devise_for :usuarios

  namespace :api do
    resources :boletos, only: [] do
      get :ventas, on: :member
    end
    resources :productos, only: :index
  end

  resources :armazones
  resources :lentes
  resources :micas
  resources :tratamientos
  resources :vendedores, except: [:destroy]
  resources :ventas

  root 'homes#index'
end
