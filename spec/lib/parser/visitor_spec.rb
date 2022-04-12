# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Parser::Visitor do
  describe '.new' do
    context 'when called with ip' do
      subject { described_class.new("127.0.0.1") }

      it 'creates Visitor object with ip' do
        expect(subject.ip).to eq("127.0.0.1")
      end
    end
  end
end
