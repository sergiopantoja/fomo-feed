require 'date'
require 'fomo_feed'

# ==========================================================================
# Usage: just pass in the filename and list of sources! Valid source classes
#        are currently only FomoFeed::RedditSource
# ==========================================================================

hackernews = FomoFeed::HackerNewsSource.new
reddit_front = FomoFeed::RedditSource.new
reddit_multi = FomoFeed::RedditSource.new("worldnews", "frogs", "LearnUselessTalents")
sources = [hackernews, reddit_front, reddit_multi]

filename = "./#{Time.now.strftime('%y%m-%d')}.html"

FomoFeed.file_from_sources(filename, sources)
