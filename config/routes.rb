Rails.application.routes.draw do  

  devise_for :log_users
  authenticated :log_user do
    root to: 'companies#index'
  end
  root to: 'tops#index'

  resources :companies do
    resources :comments do
    end
    resources :groups do
      resources :users do
        resources :name_cards
      end
    end
  end
  
  resources :tops, only: [:index]

  post "companies/comment" => "companies#comment"
end
