Rails.application.routes.draw do
  resources :cards
  devise_for :users
  resources :subjects
  resources :verbs
  resources :victims
  resources :topics

  namespace :api do
    post 'authenticate', to: 'authentication#authenticate'
    namespace :v1 do
      get 'topics', to: 'topics#index'
      post 'update_user_topic', to: 'topics#update_user_topic'
      post 'update_score', to: 'scores#update_score'
      post 'cards', to: 'cards#index'
      post 'update_user_topic', to: 'cards#update_user_topic'
      post 'make_card', to: 'cards#make_card'
      post 'create_card', to: 'cards#create'
    end
  end
    root to: "topics#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
