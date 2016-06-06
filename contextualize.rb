#!/usr/bin/env ruby

require 'optparse'
options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: contextualize [options]"
  opts.on('-c', '--context REGEX', 'Regex to identify context lines') { |v| options[:regex] = v }
end.parse!

rx = /#{options[:regex]}/
context = ""

ARGF.each_with_index do |line, idx|
	m = rx.match(line)
	context = m[0] if m
    print context, ": ", line
end