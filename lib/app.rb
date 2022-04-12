# frozen_string_literal: true

# Main application class for orchestrating parsing, analysing and presenting.
class App
  attr_reader :log_file, :parser

  ACCEPTED_FILE_TYPE = '.log'

  def initialize(log_file, parser: Parser::LogFormat::Webserver)
    @log_file = log_file
    @parser = parser
  end

  def process
    validate_file!
    parser.new(log_text).tap(&:parse)
    true
  end

  private

  def validate_file!
    raise LoadError, "File does not exists -- #{log_file}" unless File.file?(log_file)
    return if File.extname(log_file) == ACCEPTED_FILE_TYPE

    raise Parser::Exception::InvalidFileType, "File appears not to be a .log -- #{log_file}"
  end

  def log_text
    File.foreach(log_file)
  end
end
