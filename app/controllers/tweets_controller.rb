class TweetsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_tweet, only: %i[edit update destroy]

  def index
    @tweets = Current.user.tweets
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweets = Current.user.tweets.new(tweet_params)
    if @tweets.save
      redirect_to :tweets, notice: 'Tweet was scheduled successfully'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @tweet.update(tweet_params)
      redirect_to :tweets, notice: 'Tweet was updated successfully'
    else
      render :new
    end
  end

  def destroy
    @tweet.destroy
    redirect_to :tweets, notice: 'Tweet was unscheduled'
  end

  private

  def set_tweet
    @tweet = Current.user.tweets.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:twitter_acount_id, :body, :publish_at)
  end
end
