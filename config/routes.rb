Rails.application.routes.draw do
  devise_for :users
  root 'memos#index'
  resources :memos
  get 'all_memos', to: 'memos#all_memos'
end