Apollo::Application.routes.draw do

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  resources :bands, only: [:show]

  namespace :admin do
    scope :band do
      get :edit,    :to => 'bands#edit', as: 'edit_band'
      put :update,  :to => 'bands#update', as: 'update_band'
    end
  end

  authenticated :user do
    root :to => 'admin/bands#edit', :as => "admin_root"
  end

  unauthenticated :user do
    devise_scope :user do
      root to: "devise/registrations#new"
    end
  end
end
