File.open('1.in') do |file|
  left = []
  right = []
  file.each_line do |line|
    line_parts = line.split(/\s+/)
    left << line_parts[0]
    right << line_parts[1]
  end
  left.sort!
  right.sort!

  distance = 0
  left.zip(right).each do |pair|
    # puts "#{pair[0]} #{pair[1]} #{(pair[0].to_i - pair[1].to_i).abs}"
    distance += (pair[0].to_i - pair[1].to_i).abs
  end
  puts distance

end
