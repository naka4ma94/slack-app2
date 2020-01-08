Rails.application.routes.draw do
  resources :workspaces do
    resources :rooms
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
