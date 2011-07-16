class Tweets
  include HTTParty
  base_uri 'https://api.twitter.com/1'
  disable_rails_query_string_format

  def fetch(username, entities = true, count = 10, since = nil)
    self.class.get("/statuses/user_timeline.json", 
      :query => {
        :include_entities => entities,
        :screen_name => username,
        :count => 10,
        :since_id => since
    })
  end

  def parse_tweet(tweet)
    parsed_tweet = {
      :id => tweet['id'],
      :text => tweet['text'],
      :url => "http://twitter.com/#{tweet['user']['screen_name']}/status/#{tweet['id']}",
      :created_at => tweet['created_at']
    }
    return parsed_tweet
  end

  def fetch_formatted(username, entities = true, count = 10, since = nil)
    raw_tweets = fetch(username, entities, count, since)
    parsed_tweets = []
    
    for tweet in raw_tweets
      parsed_tweets.push(self.parse_tweet(tweet))
    end

    return parsed_tweets
  end
end
