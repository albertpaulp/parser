# frozen_string_literal: true

# Entity that holds visit information for a page. Created with unique page url.
module Parser
  class WebPage
    attr_reader :url, :visitor_records

    def initialize(url)
      @url = url
      @visitor_records = {}
    end

    def visit(visitor)
      return update_visit_count(visitor) if visitor_records.keys.include?(visitor.ip)

      create_new_visit_record(visitor)
    end

    def total_page_views
      visitor_records.values.sum
    end

    def total_unique_page_views
      visitor_records.keys.count
    end

    private

    def update_visit_count(visitor)
      visitor_records[visitor.ip] = visitor_records[visitor.ip] + 1
    end

    def create_new_visit_record(visitor)
      visitor_records.merge!(visitor.ip => 1)
    end
  end
end
