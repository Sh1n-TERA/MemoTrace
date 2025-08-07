Rails.application.routes.draw do
  devise_for :users
  root 'memos#index'
  resources :memos
end
