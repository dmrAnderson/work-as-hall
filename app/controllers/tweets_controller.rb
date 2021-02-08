class TweetsController < ApplicationController
  before_action :require_user_logged_in!

  def index
    @tweets = Current.user.tweets
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweets = Current.user.tweets.new(tweet_params)
    if @tweets.save
      redirect_to(:tweets, notice: 'Tweet was scheduled successfully')
    else
      render(:new)
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:twitter_acount_id, :body, :publish_at)
  end
end
