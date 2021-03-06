#!/usr/bin/env ruby
# frozen_string_literal: true

require 'zeitwerk'
# Use Zeitwerk to automate file loading
loader = Zeitwerk::Loader.new
loader.push_dir('lib')
loader.setup

log_file = ARGV[0]

App.new(log_file).process
