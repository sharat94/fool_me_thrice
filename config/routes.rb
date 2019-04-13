Rails.application.routes.draw do
  resources :cards
  devise_for :users
  resources :subjects
  resources :verbs
  resources :victims
  resources :topics

  root to: "topics#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
