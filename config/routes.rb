Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    member do
      get 'like', to: 'posts#like', as: 'like'
      get 'unlike', to: 'posts#unlike', as: 'unlike'
    end
    resources :comments, only:[:create,:delete]
  end

  root to: 'pages#welcome'
end
