Rails.application.routes.draw do
  get 'about/top'
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'about#top'
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :edit, :update ,:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
