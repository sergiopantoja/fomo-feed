Gem::Specification.new do |s|
  s.name        = 'fomo_feed'
  s.version     = '0.2.0'
  s.date        = '2017-01-17'
  s.summary     = "FOMO Feed"
  s.description = "Consume news intelligently. FOMO lets you batch your input so you can supercharge your output."
  s.authors     = ["Sergio Pantoja"]
  s.email       = 'sergio@sergiopantoja.com'
  s.files       = [
                    "lib/fomo_feed.rb",
                    "lib/fomo_feed/story.rb",
                    "lib/fomo_feed/source.rb",
                    "lib/fomo_feed/reddit_source.rb",
                    "lib/fomo_feed/hacker_news_source.rb"
                  ]
  s.homepage    = 'http://rubygems.org/gems/fomo_feed'
  s.license     = 'MIT'
end
