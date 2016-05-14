Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'registrations' }, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  devise_scope :user do
    authenticated :user do
      root 'users#show', as: :authenticated_root
    end

    unauthenticated do
      root 'users#signup', as: :unauthenticated_root
    end
  end

  resources :users, only: [:show]
end
