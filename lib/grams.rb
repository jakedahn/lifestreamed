class Grams
  include HTTParty

  base_uri 'https://api.instagram.com/v1'
  disable_rails_query_string_format

  def fetch(count=10)
    self.class.get("/users/self/media/recent", 
      :query => {
        :count => count,
        :access_token => Service.find_by_name("instagram").username
    })['data']
  end

  def parse_gram(gram)
    text = gram.fetch('caption', "").blank? ? "" : gram['caption']['text']
    created_at = gram.fetch('caption', "").blank? ? gram['created_time'] : Time.at(gram['created_time'].to_i)
    parsed_gram = {
      :g_id => gram['id'],
      :text => text,
      :link => gram['link'],
      :image_url => gram['images']['standard_resolution']['url'],
      :created_at => created_at
    }

    return parsed_gram
  end

  def fetch_formatted(count=10)
    raw_grams = self.fetch(count)
    parsed_grams = []
    
    for gram in raw_grams
      parsed_grams.push(self.parse_gram(gram))
    end

    return parsed_grams
  end
end
