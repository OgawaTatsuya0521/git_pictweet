class TweetsController < ApplicationController
  
  before_action :move_to_index, except: [:index, :show]
  
  # 一覧画面表示アクション
  def index
    @tweets=Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end
  
  # 投稿画面表示アクション
  def new
  
  end
  
  # 投稿された内容をテーブルに保存
  def create
    Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
    # binding.pry
  end

def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
end

def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params) if tweet.user_id == current_user.id
end

def edit
    @tweet = Tweet.find(params[:id])
end

def show
  @tweet=Tweet.find(params[:id])
  @comments = @tweet.comments.includes(:user)
end

private
def tweet_params
  params.permit(:image, :text)
  # binding.pry

end  


def move_to_index
  # ログインしていなかった場合、「index」アクションを実行する
  redirect_to action: :index  unless user_signed_in?
end
  
end
