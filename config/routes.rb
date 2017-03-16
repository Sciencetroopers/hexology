Rails.application.routes.draw do

  devise_for :users
  resources :questions
  get 'pages/question'
  post 'pages/check'
  get 'pages/contact'
  get 'pages/rules'
  get 'pages/winner'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
