Rails.application.routes.draw do

  resources :usuarios
  resources :profiles
  resources :areas
  resources :tipo_atendimentos

  get 'welcome/index'

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to:'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
