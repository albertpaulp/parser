# frozen_string_literal: true

require 'spec_helper'

RSpec.describe App do
  describe '.process' do
    subject { described_class.new(file_name) }

    context 'when non-existant file is passed in' do
      let(:file_name) { '/dev/null' }

      it 'raise LoadError with error message' do
        expect { subject.process }.to raise_error(LoadError, 'File does not exists -- /dev/null')
      end
    end

    context 'when existing file is passed' do
      context 'when passed file is not log file' do
        let(:file_name) { 'spec/support/unknown.output' }

        it 'raise LoadError with error message' do
          expect { subject.process }.to raise_error(
            Parser::Exception::InvalidFileType,
            'File appears not to be a .log -- spec/support/unknown.output'
          )
        end
      end

      context 'when passed file is a valid log file' do
        let(:fake_webserver_parser) { instance_double(Parser::LogFormat::Webserver, parse: []) }
        let(:file_name) { 'spec/support/oneline.log' }
        subject { described_class.new(file_name, parser: double(new: fake_webserver_parser)) }

        it 'calls parse method on parser' do
          expect(fake_webserver_parser).to receive(:parse)

          subject.process
        end
      end
    end
  end
end
