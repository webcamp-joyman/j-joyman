Rails.application.routes.draw do
# 顧客用
# URL /customers/sign_in ...
devise_for :members,skip:[:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin,skip:[:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}
 # 会員側のルーティング設定
  scope module: :public do
  root to: "homes#top"
  get '/about' => 'homes#about', as: 'about'

  resources :items, only: [:index, :show]

  get '/mypage' => 'members#show'
  get '/mypage/edit' => 'members#edit'
  patch '/mypage' => 'members#update'
  get '/mypage/unsubscribe' => 'members#unsubscribe', as: 'unsubscribe'
  patch '/mypage/withdraw' => 'members#withdraw', as: 'withdraw'

  delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :cart_items, only: [:index, :update, :destroy, :create]

  post '/orders/confirmation' => 'orders#confirmation'
  get '/orders/complete' => 'orders#complete'
  resources :orders, only: [:index, :show, :new, :create]

  resources :addresses, only: [:index, :create, :edit, :update, :destroy]

  get "/items/genre_search/:id" => "items#genre_search",as: 'items_genre_search'
  end

  # 管理者側のルーティング設定
  namespace :admin do
  root to: "homes#top"

  resources :items, except: [:destroy]

  resources :genres, only: [:index, :create, :edit, :update]

  resources :members, only: [:index, :show, :edit, :update]

  resources :orders, only: [:show, :update]

  resources :order_details, only: [:update]

  end
end
