Rails.application.routes.draw do
  devise_for :usuarios

  namespace :api do
    resources :productos, only: :index
    resources :boletos, only: [] do
      get :ventas, on: :member
    end
  end

  resources :armazones
  resources :lentes
  resources :micas
  resources :vendedores, except: [:destroy]
  resources :ventas

  root 'homes#index'
end
