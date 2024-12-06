File.open('1.in') do |file|
  left = []
  right = []
  file.each_line do |line|
    line_parts = line.split(/\s+/)
    left << line_parts[0]
    right << line_parts[1]
  end

  left = left.map(&:to_i)
  right = right.map(&:to_i)

  left_count = left.tally
  right_count = right.tally

  sum = 0
  left.each do |key|
    sum += key * (right_count[key] || 0)
  end
  puts sum
end
