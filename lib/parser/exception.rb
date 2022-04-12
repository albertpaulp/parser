# frozen_string_literal: true

module Parser
  module Exception
    class InvalidFileType < StandardError; end
    class InvalidSortOrder < StandardError; end
    class InvalidSortBy < StandardError; end
  end
end
