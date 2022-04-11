# frozen_string_literal: true

# Main application class for orchestrating parsing, analysing and presenting.
class App
  attr_reader :log_file

  def initialize(log_file)
    @log_file = log_file
  end

  def analyse
  end
end
