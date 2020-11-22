class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index]  

  def new
    @tweet = Tweet.new  
  end

  def create
    @tweet = Tweet.new(tweet_params)  
    @tweet.user_id = current_user.id 
    @tweet.save
    redirect_to tweets_path
  end

  def index
    @tweets = Tweet.order("updated_at DESC").page(params[:page]).per(5)
  end

  def show
    @tweet = Tweet.find(params[:id])
    @user = @tweet.user
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
     tweet.destroy 
    end
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
    
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
    end
  end

  private
    def tweet_params
      params.require(:tweet).permit(:body) 
    end
end
