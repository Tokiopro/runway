Rails.application.routes.draw do
  #会員側

  #ゲストログイン機能のルーティング追加
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  #scopeメソッドでurlのpublicを消去
  scope module: :public do
    root to: 'homes#top'
    devise_for :users, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }
    get 'about', to: 'homes#about'
    resources :users, only: [:show, :edit, :update]
    # 退会確認画面
    get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    # 論理削除用のルーティング
    patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
    get '/search', to: 'homes#search'
    resources :posts, except: [:index] do
      resources :post_comments, only: [:create, :destroy]
      resources :gos, only: [:create, :destroy]
      resources :gones, only: [:create, :destroy]
      get '/tag/:hashname', to: "posts#tag"
    end

  end

  #管理者側
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    root to: 'homes#top'
    resources :users, only: [:index, :show]
    # 退会確認画面
    get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    # 論理削除用のルーティング
    patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
  end
end
