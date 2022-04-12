#!/usr/bin/env ruby

require "zeitwerk"
# Use Zeitwerk to automate file loading
loader = Zeitwerk::Loader.new
loader.push_dir('lib')
loader.setup

log_file = ARGV[0]

puts App.new(log_file).process
