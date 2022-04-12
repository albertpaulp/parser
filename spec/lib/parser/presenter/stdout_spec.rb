# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Parser::Presenter::Stdout do
  let(:fake_analyser) { instance_double(Parser::Analyser, sort: []) }

  describe '.print' do
    context 'when analyser is passed in' do
      it 'calls sort on analyser with order: :desc, by: :total_page_views' do
        expect(fake_analyser).to receive(:sort).with(order: :desc, by: :total_page_views)

        described_class.print(fake_analyser)
      end

      it 'calls sort on analyser with order: :desc, by: :unique_page_views' do
        expect(fake_analyser).to receive(:sort).with(order: :desc, by: :unique_page_views)

        described_class.print(fake_analyser)
      end

      xit 'title is printed in stdout' do
        #TODO
      end

      xit 'web_page table is printed in stdout' do
        #TODO
      end
    end
  end
end
