#!/usr/bin/env ruby

$LOAD_PATH.unshift(File.expand_path('../../lib',__FILE__)) unless $LOAD_PATH.include?(File.expand_path('../../lib',__FILE__))

require 'Helpers'

parser = Helpers::Parser.new(ARGV[0])

print parser.output

exit parser.exit_code
