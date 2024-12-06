File.open('2.in') do |file|
  total = 0
  safe = true
  file.each_line do |line|
    safe = true
    levels = line.chomp.split(' ').map(&:to_i)
    increasing = nil
    levels.each_cons(2) do |a, b|
      if increasing.nil?
        increasing = a < b
      elsif increasing && b < a
        safe = false
        break
      elsif !increasing && a < b
        safe = false
        break
      end

      difference = (b - a).abs
      if  difference < 1 || difference > 3
        safe = false
        break
      end
    end
    total += 1 if safe
  end
  puts total
end
