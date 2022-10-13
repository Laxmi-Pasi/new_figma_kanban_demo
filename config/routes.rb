Rails.application.routes.draw do
  root 'homes#index'
  post 'developer_status_update', to: 'homes#developer_status_update'
end
