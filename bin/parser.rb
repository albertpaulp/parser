#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/app'

log_file = ARGV[0]

puts App.new(log_file).process
