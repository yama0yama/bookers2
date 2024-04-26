Rails.application.routes.draw do
  
  devise_for :users
  root to: 'homes#top'
  get "" => 'homes#top'
  get "homes/about" => "homes#about", as: "about"
  resources :books_image
  resources :users, only: [:show, :edit, :create, :index]
  
end
