Rails.application.routes.draw do
  devise_for :users
  root 'memos#index'
  get 'memos/calendar', to: 'memos#calendar'
  resources :memos
  get 'memos/on_date(/:date)', to: 'memos#show_on_date', as: 'memos_on_date'
  get 'all_memos', to: 'memos#all_memos'
  delete '/images/:id', to: 'memos#delete_image', as: 'delete_image'
end