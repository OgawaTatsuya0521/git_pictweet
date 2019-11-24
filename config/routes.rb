Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tweets#index'             #ツイート一覧画面
  # get   'tweets'      =>  'tweets#index'
  # get 'tweets/new'  =>  'tweets#new'       #ツイート投稿画面
  # post 'tweets'  =>  'tweets#create'       #ツイート投稿機能
  # delete  'tweets/:id'  => 'tweets#destroy'     #ツイートの削除
  # patch   'tweets/:id'  => 'tweets#update'      #ツイートの更新
  # get   'tweets/:id/edit'  => 'tweets#edit'       #ツイートの編集
  # get 'tweets/:id' => 'tweets#show'       #ツイート詳細画面
  # get   'users/:id'   =>  'users#show'    #Mypageへのルーティング
  resources :tweets do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]       #users_controllerに対してのresourcesメソッド
end
