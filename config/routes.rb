Apollo::Application.routes.draw do

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end

  unauthenticated :user do
    devise_scope :user do
      root to: "devise/registrations#new"
    end
  end

  resources :bands, only: [:show]

  namespace :admin do
    root to: 'bands#edit'
  end
end
