# frozen_string_literal: true
require 'pry'
RSpec.describe 'Parser bin executable' do
  context 'when CLI is invoked with valid log file' do
    it 'returns successful exit status(0)' do
      expect(system('./bin/parser.rb webserver.log')).to be_truthy
    end
  end

  context 'when CLI is invoked with non-existent file' do
    it 'returns unsuccessful exit status(2)' do
      expect(system('./bin/parser.rb puma.log')).to be_falsey
    end
  end
end

