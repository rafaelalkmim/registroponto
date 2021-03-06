Rails.application.routes.draw do

  resources :horarios
  resources :usuarios

  get 'welcome/index'

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to:'horarios#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
