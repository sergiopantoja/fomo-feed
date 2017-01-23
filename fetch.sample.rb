require 'date'
require 'fomo-fetch'

# ==========================================================================
# Usage: just pass in the filename and list of sources! Valid source methods
#        are currently #hackernews and #reddit
# ==========================================================================

puts "Fetching feeds..."

sources = [
  {name: "Hacker News",  stories: Fomo::Fetch.hackernews},
  {name: "Reddit Front", stories: Fomo::Fetch.reddit},
  {name: "Reddit Multi", stories: Fomo::Fetch.reddit("worldnews", "frogs", "LearnUselessTalents")}
]

filename = "./#{Time.now.strftime('%y%m-%d')}.html"

puts "Creating file..."

File.open(filename, 'w') do |f|
  f.write "<html><body>"
  sources.each do |source|
    puts "Writing feed for #{source[:name]}"
    f.write "<h1>#{source[:name]}</h1><ul>"

    source[:stories].each do |story|
      f.write "<li><a href=\"#{story.url}\">#{story.title}</a></li>"
    end

    f.write "</ul>"
  end
  f.write "</body></html>"
end

puts "Done!"
