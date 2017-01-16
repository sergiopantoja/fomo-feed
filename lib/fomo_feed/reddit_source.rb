require 'unirest'

class FomoFeed::RedditSource < FomoFeed::Source
  def stories
    response = Unirest.get(@url).body['data']['children']
    response.map do |hash|
      params = {
        title: hash['data']['title'],
        url: hash['data']['url'],
        comments_url: "http://reddit.com#{hash['data']['permalink']}",
        score: hash['data']['score'],
        category: hash['data']['subreddit']
      }

      FomoFeed::Story.new(params)
    end
  end
end
