# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Parser::LogFormat::Webserver do
  describe '.parse' do
    let(:file_name) { 'spec/support/sample_logfile.log' }
    let(:log_contents) { File.foreach(file_name) }
    let(:fake_visitor) { instance_double(Parser::Visitor, ip: "126.318.035.038") }
    let(:fake_webpage) { instance_double(Parser::WebPage, url: "/help_page/1", visit: true) }
    subject do
      described_class.new(
        log_contents,
        visitor_klass: class_double(Parser::Visitor, new: fake_visitor),
        web_page_klass: class_double(Parser::WebPage, new: fake_webpage)
      )
    end

    context 'when one line log is passed in' do
      let(:file_name) { 'spec/support/oneline.log' }

      it 'call .visit on webpage with visitor' do
        expect(fake_webpage).to receive(:visit).with(fake_visitor)

        subject.parse
      end
    end

    context 'when multi-line log is passed in' do
      let(:file_name) { 'spec/support/sample_logfile.log' }
      before do
        subject.parse
      end

      it 'creates 2 webpages' do
        expect(subject.web_pages.count).to eq(2)
      end

      it 'creates 2 visitors' do
        expect(subject.visitors.count).to eq(2)
      end
    end
  end
end
