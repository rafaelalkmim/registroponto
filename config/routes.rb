Rails.application.routes.draw do
  resources :tipo_atendimentos
  devise_for :users
  get 'welcome/index'

  resources :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to:'welcome#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
