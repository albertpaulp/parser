# frozen_string_literal: true

# Main application class for orchestrating parsing, analysing and presenting.
class App
  attr_reader :log_file
  ACCEPTED_FILE_TYPE = '.log'

  def initialize(log_file)
    @log_file = log_file
  end

  def process
    validate_file!
    true
  end

  private

  def validate_file!
    raise LoadError, "File does not exists -- #{log_file}" unless File.file?(log_file)
    return if File.extname(log_file) == ACCEPTED_FILE_TYPE

    raise InvalidFileType, "File appears not to be a .log -- #{log_file}"
  end
end
