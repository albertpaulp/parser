# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Parser::Analyser do
  let(:fake_page_a) do
    instance_double(Parser::WebPage, url: 'A', total_page_views: 12, total_unique_page_views: 10)
  end
  let(:fake_page_b) do
    instance_double(Parser::WebPage, url: 'B', total_page_views: 150, total_unique_page_views: 150)
  end
  let(:fake_page_c) do
    instance_double(Parser::WebPage, url: 'C', total_page_views: 500, total_unique_page_views: 100)
  end
  let(:web_pages) { [fake_page_a, fake_page_b, fake_page_c] }
  subject { described_class.new(web_pages) }

  describe '#sort' do
    context 'when invalid sort order is called' do
      it 'raises InvalidSortOrder with error message' do
        expect do
          subject.sort(order: :asc)
        end.to raise_error(Parser::Exception::InvalidSortOrder, 'Unsupported sort order')
      end
    end

    context 'when invalid sort by is passed' do
      it 'raises InvalidSortBy with error message' do
        expect do
          subject.sort(by: :time)
        end.to raise_error(Parser::Exception::InvalidSortBy, 'Unsupported sort by')
      end
    end

    context 'when sort order is desc' do
      context 'when order by is total_page_views' do
        it 'returns web_pages sort by total_page_views in descending order' do
          web_pages = subject.sort(order: :desc, by: :total_page_views)

          expect(web_pages.map(&:url)).to eq(%w[C B A])
        end
      end
    end

    context 'when sort order is desc' do
      context 'when order by is unique_page_views' do
        it 'returns web_pages sort by total_page_views in descending order' do
          web_pages = subject.sort(order: :desc, by: :unique_page_views)

          expect(web_pages.map(&:url)).to eq(%w[B C A])
        end
      end
    end
  end
end
