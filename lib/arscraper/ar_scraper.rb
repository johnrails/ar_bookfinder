module Arscraper
  class ArScraper

    def initialize(ar_results)
      @ar_results = ar_results
    end

    def book_title
      results_page.search('#Table7').first.children[1].children[3].children.first.text
    end

    def book_description
      results_page.search('#Table7').first.children[1].children[3].text
    end

    def book_level
      parent_node.children[7].children[4].children.first.text
    end

    def ar_points
      parent_node.children[7].children[6].children.first.text
    end

    private

    def parent_node
      results_page.search('#Table7').first.children[1].children[3]
    end

    def results_page
      @ar_results
    end
  end
end
