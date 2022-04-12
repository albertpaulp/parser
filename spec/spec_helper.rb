# frozen_string_literal: true
require 'rspec'
require "zeitwerk"

# Use Zeitwerk to automate file loading
loader = Zeitwerk::Loader.new
loader.push_dir('lib')
loader.setup

RSpec.configure do |config|
end
