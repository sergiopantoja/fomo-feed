require 'unirest'

class FomoFeed::HackerNewsSource < FomoFeed::Source
  attr_reader :name

  API_ROOT = "https://hacker-news.firebaseio.com/v0/"
  STORY_LIMIT = 30
  STORY_IDS_PATH = "topstories.json"
  STORY_PATH = "item/{{id}}.json"

  def initialize
    @name = "HackerNews"
  end

  def top_story_ids
    response = Unirest.get(API_ROOT + STORY_IDS_PATH).body
    response.first(STORY_LIMIT)
  end

  def stories
    top_story_ids.map do |id|
      hash = Unirest.get(API_ROOT + STORY_PATH.gsub("{{id}}", id.to_s)).body

      params = {
        title:        hash['title'],
        url:          hash['url'],
        comments_url: "https://news.ycombinator.com/item?id=#{hash['id']}",
        score:        hash['score'],
        category:     hash['type']
      }

      FomoFeed::Story.new(params)
    end
  end
end
