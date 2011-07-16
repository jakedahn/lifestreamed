class Songs
  include HTTParty

  base_uri 'http://ws.audioscrobbler.com/2.0'
  disable_rails_query_string_format

  def fetch(user, method='user.getrecenttracks', format='json', limit=50)
    self.class.get("/", 
      :query => {
        :method => method,
        :format => format,
        :api_key => ENV['lastfm_key'].blank? ? API_KEYS['lastfm']['key'] : ENV['lastfm_key'],
        :user => user,
        :limit => limit
    })['recenttracks']['track']
  end

  def parse_song(song)
    parsed_song = {
      :time_id => song['date']['uts'],
      :artist => song['artist']['#text'],
      :album => song['album']['#text'],
      :track => song['name'],
      :url => song['url'],
      :created_at => Time.at(song['date']['uts'].to_i)
    }
    return parsed_song
  end

  def fetch_formatted(user, method='user.getrecenttracks', format='json', limit=50)
    raw_songs = fetch(user, method, format, limit)
    raw_songs.pop
    raw_songs.shift

    parsed_songs = []

    for song in raw_songs
      parsed_songs.push(self.parse_song(song))
    end

    return parsed_songs
  end
end
