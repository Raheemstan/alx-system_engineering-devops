#!/usr/bin/env ruby

regex = /from:(\+?\w+|\s*)(?=\])\s*\[to:(\+?\w+|\s*)(?=\])\s*\[flags:(.*?)\]/ 
matches = ARGV[0].scan(regex)
matches.each do |match|
  puts "#{match[0]},#{match[1]},#{match[2]}"
end
