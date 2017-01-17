require 'date'
require 'fomo_feed'

# ==========================================================================
# Usage: just pass in the filename and list of sources! Valid source classes
#        are currently only FomoFeed::RedditSource
# ==========================================================================

# hackernews = FomoFeed::Source.new(name: "Hacker News", url: "https://news.ycombinator.com/rss")
reddit_front = FomoFeed::RedditSource.new
reddit_multi = FomoFeed::RedditSource.new("worldnews", "frogs", "LearnUselessTalents")
sources = [reddit_front, reddit_multi]

filename = "./#{Time.now.strftime('%y%m-%d')}.html"

FomoFeed.file_from_sources(filename, sources)
