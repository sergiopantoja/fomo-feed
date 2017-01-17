class FomoFeed::Source
  def stories
    # this should be implemented by subclasses
    raise NotImplementedError
  end
end
