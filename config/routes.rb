Rails.application.routes.draw do
  #会員側
  #scopeメソッドでurlのpublicを消去
  scope module: :public do
    root to: 'homes#top'
    devise_for :users, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }
    get 'about', to: 'homes#about'
    resources :users, only: [:show, :edit, :update]
    resources :posts, except: [:index] do
      resources :post_comments, only: [:create, :destroy]
    end

  end

  #管理者側
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
