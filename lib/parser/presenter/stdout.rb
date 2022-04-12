# frozen_string_literal: true

# Pretty print analysed data to STDOUT
module Parser
  module Presenter
    class Stdout
      module Headers
        SORT_BY_TOTAL_VIEWS = 'List of webpages with most page views ordered from most pages views to less page views.'
        SORT_BY_UNIQUE_VIEWS = 'List of webpages with most unique page views also ordered'
      end

      class << self
        def print(analyser)
          print_sort_by_total_views(analyser)
          print_sort_by_unique_views(analyser)
        end

        private

        def print_sort_by_total_views(analyser)
          print_title(Headers::SORT_BY_TOTAL_VIEWS)
          web_pages = analyser.sort(order: :desc, by: :total_page_views)

          print_web_pages(web_pages)
        end

        def print_sort_by_unique_views(analyser)
          print_title(Headers::SORT_BY_UNIQUE_VIEWS)
          web_pages = analyser.sort(order: :desc, by: :unique_page_views)

          print_web_pages(web_pages)
        end

        def print_title(title)
          puts title
          puts '=' * title.length
        end

        def print_web_pages(web_pages)
          puts 'Total Views || Unique Views || URL'
          puts '-----------------------------------------'
          web_pages.each do |web_page|
            puts "#{web_page.total_page_views}             #{web_page.total_unique_page_views}            #{web_page.url}"
          end
        end
      end
    end
  end
end
