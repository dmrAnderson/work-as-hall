class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  validates :body, presence: true, length: { maximum: 280 }
  validates :publish_at, presence: true

  after_initialize -> { self.publish_at ||= 24.hour.from_now }

  def published?
    tweet_id?
  end

  def publish_to_twitter!
    tweet = twitter_account.client.update(body)
    update(tweet_id: tweet.id)
  end
end
