Rails.application.routes.draw do  

  #root to: 'tops#index'
  devise_for :log_users
  authenticated :log_user do
    root to: 'companies#index'
  end
  root to: 'tops#index'

=begin
  devise_for :log_users do
    devise_scope :log_user do
      authenticated :log_user do
        root :to => 'companies#index', as: :authenticated_root
      end
      unauthenticated :log_user do
        root :to => 'devise/registrations#new', as: :unauthenticated_root
      end
    end
  end
=end

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
