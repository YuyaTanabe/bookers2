Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


    root to: 'home#top' #ルートパス

    
    get "users/:id" => "users#show", as: :mypage #ログイン中はマイページ
    

    get '/top' => 'home#top'

    get '/about' => 'home#about'


    resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]

    resources :users, only: [:show, :index, :edit, :update]


end
