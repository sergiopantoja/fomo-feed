require 'unirest'

class FomoFeed::RedditSource < FomoFeed::Source
  attr_reader :name
  attr_reader :subreddits

  def initialize(*subreddits)
    @subreddits = subreddits || []
    @name = case subreddits.size
      when 0; "Reddit Frontpage"
      when 1; "Reddit r/#{subreddits.first}"
      else;   "Reddit Multi"
    end
  end

  def stories
    response = Unirest.get(url).body['data']['children']
    response.map do |hash|
      params = {
        title:        hash['data']['title'],
        url:          hash['data']['url'],
        comments_url: "http://reddit.com#{hash['data']['permalink']}",
        score:        hash['data']['score'],
        category:     hash['data']['subreddit']
      }

      FomoFeed::Story.new(params)
    end
  end

  def url
    root = "http://www.reddit.com/"
    subdir = subreddits.empty? ? "" : "r/#{subreddits.join('+')}"
    extension = ".json"
    root + subdir + extension
  end
end
