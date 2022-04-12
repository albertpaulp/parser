# frozen_string_literal: true

# Parser that can parse Webserver logs
module Parser
  module LogFormat
    class Webserver
      attr_reader :logs, :visitor_klass, :web_page_klass, :web_pages, :visitors

      module Schema
        PAGE_NAME = 0
        IP = 1
      end

      def initialize(logs, visitor_klass: Parser::Visitor, web_page_klass: Parser::WebPage)
        @logs = logs
        @visitor_klass = visitor_klass
        @web_page_klass = web_page_klass
        @web_pages = []
        @visitors = []
      end

      def parse
        logs.each do |line|
          visit = line.split
          visitor = create_or_find_visitor(visit[Schema::IP])
          web_page = create_or_find_web_page(visit[Schema::PAGE_NAME])

          web_page.visit(visitor)
        end
      end

      private

      def create_or_find_visitor(ip)
        visitor = visitors.find { |visitor| visitor.ip == ip }
        return visitor if visitor

        visitor = visitor_klass.new(ip)
        visitors.push(visitor)
        visitor
      end

      def create_or_find_web_page(url)
        web_page = web_pages.find { |web_pages| web_pages.url == url }
        return web_page if web_page

        web_page = web_page_klass.new(url)
        web_pages << web_page
        web_page
      end
    end
  end
end
