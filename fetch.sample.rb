require 'date'
require 'feedjira'

# ==========================================================================
# Edit the filename and feeds to your liking.
# ==========================================================================

FILENAME = "./#{Time.now.strftime('%y%m-%d')}.html"
HACKERNEWS = {name: "Hacker News", url: "https://news.ycombinator.com/rss"}
REDDIT_FRONT = {name: "Reddit Frontpage", url: "http://www.reddit.com/.rss"}
REDDIT_MULTI = {name: "Reddit Subreddits", url: "http://www.reddit.com/r/worldnews+frogs+LearnUselessTalents.rss"}

sources = [HACKERNEWS, REDDIT_FRONT, REDDIT_MULTI]

# ==========================================================================
# No need to edit below this line (unless you want to change the HTML output)
# ==========================================================================

sources.each do |source|
  puts "Fetching feed for #{source[:name]}"
  source[:feed] = Feedjira::Feed.fetch_and_parse(source[:url]).entries
end

puts "Writing file..."

File.open(FILENAME, 'w') do |f|
  f.write "<html><body>"
  sources.each do |source|
    f.write "<h1>#{source[:name]}</h1><ul>"
    source[:feed].each do |entry|
      f.write "<li><a href=\"#{entry.url}\">#{entry.title}</a></li>"
    end
    f.write "</ul>"
  end
  f.write "</body></html>"
end

puts "Done!"
