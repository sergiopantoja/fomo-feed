module Fomo

  module Fetch

    class Story
      attr_reader :title
      attr_reader :url
      attr_reader :comments_url
      attr_reader :score
      attr_reader :category

      def initialize(source:, title:, url:, comments_url:, score:, category: nil)
        @source = source
        @title = title
        @url = url
        @comments_url = comments_url
        @score = score
        @category = category
      end
    end

  end

end
