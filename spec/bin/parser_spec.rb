# frozen_string_literal: true

RSpec.describe 'Parser bin executable' do
  context 'when CLI is invoked with valid file' do
    it 'does not raise errors' do
      expect do
        system('./bin/parser.rb webserver.log')
      end.not_to raise_error
    end
  end
end

