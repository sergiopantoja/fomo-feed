require 'date'
require 'fomo_feed'

# ==========================================================================
# Usage: just pass in the filename and list of sources! Valid source classes
#        are currently only FomoFeed::RedditSource
# ==========================================================================

hackernews = FomoFeed::Source.new(name: "Hacker News", url: "https://news.ycombinator.com/rss")
reddit_front = FomoFeed::RedditSource.new(name: "Reddit Frontpage", url: "http://www.reddit.com/.json")
reddit_multi = FomoFeed::RedditSource.new(name: "Reddit Subreddits", url: "http://www.reddit.com/r/worldnews+frogs+LearnUselessTalents.json")
sources = [reddit_front, reddit_multi]

filename = "./#{Time.now.strftime('%y%m-%d')}.html"

FomoFeed.file_from_sources(filename, sources)
