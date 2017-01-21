require 'unirest'
require 'fomo-fetch/story'

module Fomo

  module Fetch

    def self.hackernews
      name = "HackerNews"
      url = "https://hacker-news.firebaseio.com/v0/"
      stories = Unirest.get(url + "topstories.json").body

      stories.first(30).map do |id|
        hash = Unirest.get(url + "item/#{id}.json").body

        params = {
          source:       name,
          title:        hash['title'],
          url:          hash['url'],
          comments_url: "https://news.ycombinator.com/item?id=#{hash['id']}",
          score:        hash['score'],
          category:     hash['type']
        }

        Fomo::Fetch::Story.new(params)
      end
    end

    def self.reddit(*subreddits)
      subreddits = subreddits || []

      name = case subreddits.size
        when 0; "Reddit Frontpage"
        when 1; "Reddit r/#{subreddits.first}"
        else;   "Reddit Multi"
      end

      url = if subreddits.empty?
        "http://www.reddit.com/.json"
      else
        "http://www.reddit.com/r/#{subreddits.join('+')}.json"
      end

      response = Unirest.get(url).body['data']['children']
      response.map do |hash|
        params = {
          source:       name,
          title:        hash['data']['title'],
          url:          hash['data']['url'],
          comments_url: "http://reddit.com#{hash['data']['permalink']}",
          score:        hash['data']['score'],
          category:     hash['data']['subreddit']
        }

        Fomo::Fetch::Story.new(params)
      end
    end

  end

end
