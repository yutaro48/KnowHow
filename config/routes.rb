Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_login'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"

  scope module: :post do
    resources :posts do
      resources :comments, only: [:new, :create, :edit, :update, :destroy]
      resource :bookmark, only: [:show, :create, :destroy]
    end

    resource :timeline, only: [:show]
  end

  scope module: :account do
    resources :accounts, only: [:index, :show] do
      resources :follows, only: [:create, :index]
      resources :unfollows, only: [:create, :index]
      resources :followers, only: [:index]
    end
  end

  namespace :user do
    resources :drafts, only: [:index]
    resource :profile, only: [:show, :edit, :update]
    resources :outputs, only: [:index]
    resources :bookmarked_posts, only: [:index]
  end

end
