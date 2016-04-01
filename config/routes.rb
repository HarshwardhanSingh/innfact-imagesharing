Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    member do
      get 'like', to: 'posts#like', as: 'like'
      get 'unlike', to: 'posts#unlike', as: 'unlike'
    end
    resources :comments, only:[:create,:destroy]
  end

  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'

  get ':user_id/follow_user', to: 'pages#follow', as: 'follow_user'
  get ':user_id/unfollow_user', to: 'pages#unfollow', as: 'unfollow_user'
  get ':username/followers', to: 'pages#followers', as: 'followers'
  get ':username/followings', to: 'pages#followings', as: 'followings'

  get ':username', to: 'pages#userpage', as: 'userpage'

  root to: 'pages#welcome'
end
