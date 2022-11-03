Rails.application.routes.draw do
  root 'homes#index'
  # resource :department, only: [:new, :create]
  get 'homes/new', to: 'homes#new', as: 'new_client_request'
  get 'departments/new', to: 'departments#new', as: 'new_department'
  get 'developers/new', to: 'developers#new', as: 'new_developer'
  get 'classic_views/index', to: 'classic_views#index', as: 'classic_view'
  delete '/classic_views' => 'classic_views#destroy_multiple'
  post 'developers/create', to: 'developers#create'
  post 'homes', to: 'homes#create'
  post 'departments', to: 'departments#create'
  post 'developer_status_update', to: 'homes#developer_status_update'
end
