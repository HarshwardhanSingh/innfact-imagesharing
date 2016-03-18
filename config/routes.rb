Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    member do
      get 'like', to: 'posts#like', as: 'like'
      get 'unlike', to: 'posts#unlike', as: 'unlike'
    end
    resources :comments, only:[:create,:delete]
  end

  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'

  get ':user_id/follow_user', to: 'posts#follow', as: 'follow_user'
  get ':user_id/unfollow_user', to: 'posts#unfollow', as: 'unfollow_user'

  root to: 'pages#welcome'
end
