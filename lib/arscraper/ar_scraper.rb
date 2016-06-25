module Arscraper
  class ArScraper

    def initialize(ar_results)
      @ar_results = ar_results
    end

    def book_title
      parent_node.children.first.text
    end

    def book_description
      parent_node.children.last.text.strip
    end

    def author
      parent_node.children[2].text.strip.split(',').reverse.join(' ').strip
    end

    def book_level
      parent_node.children[7].children[4].children.first.text
    end

    def ar_points
      parent_node.children[7].children[6].children.first.text
    end

    def cover_image
      results_page.images_with(src: /coverscans/).first
    end

    def image_source
      cover_image.src
    end

    def download_image(path)
      cover_image.fetch.save(path)
    end
    private

    attr_accessor :results_page

    def results_page
      @ar_results
    end

    def parent_node
      results_page.search('#Table7').first.children[1].children[3]
    end
  end
end
