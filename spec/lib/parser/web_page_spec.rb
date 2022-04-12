# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Parser::WebPage do
  subject { described_class.new("/about/me") }

  describe '.new' do
    context 'when called with url' do
      it 'creates web_page object with url' do
        expect(subject.url).to eq("/about/me")
      end

      it 'sets visitor_records as empty' do
        expect(subject.visitor_records).to be_empty
      end
    end
  end

  describe '#visit' do
    let(:visitor_a) { instance_double(Parser::Visitor, ip: '192.168.1.1') }

    context 'when a visitor is visiting for the first time' do
      it 'set visitor_records as 1 for visitor ip' do
        subject.visit(visitor_a)

        expect(subject.visitor_records).to eq('192.168.1.1' => 1)
      end
    end

    context 'when a visitor visit twice' do
      it 'set visitor_records as 2 for visitor ip' do
        subject.visit(visitor_a)
        subject.visit(visitor_a)

        expect(subject.visitor_records).to eq('192.168.1.1' => 2)
      end
    end
  end
end
