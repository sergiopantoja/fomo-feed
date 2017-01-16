class FomoFeed
  def self.file_from_sources(filename, sources, verbose = false)
    puts "Creating file..." if verbose

    File.open(filename, 'w') do |f|
      f.write "<html><body>"
      sources.each do |source|
        puts "Processing feed for #{source.name}" if verbose
        f.write "<h1>#{source.name}</h1><ul>"

        source.stories.each do |story|
          f.write "<li><a href=\"#{story.url}\">#{story.title}</a></li>"
        end

        f.write "</ul>"
      end
      f.write "</body></html>"
    end

    puts "Done!" if verbose
  end
end

require 'fomo_feed/story'
require 'fomo_feed/source'
require 'fomo_feed/reddit_source'
