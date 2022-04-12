# frozen_string_literal: true

# Analyser abstracts logic to aggregate parsed web_page data
module Parser
  class Analyser
    attr_reader :web_pages

    ALLOWED_SORT_ORDERS = [:desc].freeze
    ALLOWED_SORT_BY = %i[total_page_views unique_page_views].freeze

    def initialize(web_pages)
      @web_pages = web_pages
    end

    def sort(order: :desc, by: :total_page_views)
      raise Exception::InvalidSortOrder, 'Unsupported sort order' unless ALLOWED_SORT_ORDERS.include?(order)
      raise Exception::InvalidSortBy, 'Unsupported sort by' unless ALLOWED_SORT_BY.include?(by)

      send("sort_#{by}_by_#{order}_order")
    end

    def sort_total_page_views_by_desc_order
      web_pages.sort { |p1, p2| p2.total_page_views <=> p1.total_page_views }
    end

    def sort_unique_page_views_by_desc_order
      web_pages.sort { |p1, p2| p2.total_unique_page_views <=> p1.total_unique_page_views }
    end
  end
end
