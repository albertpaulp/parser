# frozen_string_literal: true

# Entity that holds unique customer/ip info
module Parser
  class Visitor
    attr_reader :ip

    def initialize(ip)
      @ip = ip
    end
  end
end
