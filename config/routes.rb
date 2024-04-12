Rails.application.routes.draw do
  devise_for :users
  get 'homus/top'
  root to: "homus#top"
end
