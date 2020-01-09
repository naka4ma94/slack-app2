Rails.application.routes.draw do
  resources :workspace_users, only: [:new, :create]
  get 'workspace/search', to: 'workspaces#search'
  get 'workspace/result', to: 'workspaces#result'

  resources :workspaces do
    resources :rooms
  end
  devise_for :users
end
