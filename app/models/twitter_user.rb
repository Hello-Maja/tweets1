class TwitterUser < ActiveRecord::Base
  has_many :tweets

  def fetch_tweets!
    top_tweets = Twitter.user_timeline(self.handle, :count => 10,
     :result_type => "recent")
    top_tweets.reverse.each do |tweet|
      self.tweets << Tweet.new(text: tweet.text, time_sent: tweet.created_at) 
    end
  end

  def avgTweetTime
    tweetcounter = self.tweets.limit(10)
    (tweetcounter.last.time_sent - tweetcounter.first.time_sent) / 10 / 60
  end

  def tweets_stale?
    (Time.now - self.tweets.last.created_at) / 60 > self.avgTweetTime
  end
end
