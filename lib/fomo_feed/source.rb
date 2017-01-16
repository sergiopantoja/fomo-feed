class FomoFeed::Source
  attr_reader :name
  attr_reader :url

  def initialize(name:, url:)
    @name = name
    @url = url
  end

  def stories
    # this should be implemented by subclasses
    raise NotImplementedError
  end
end
