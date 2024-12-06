File.open('2.in') do |file|
  total = 0
  safe = true
  file.each_line do |line|
    safe = false
    levels = line.chomp.split(' ').map(&:to_i)
    increasing = nil
    bad_levels = false

    levels[0...-1].each_with_index do |a, i|
      b = levels[i + 1]

      if increasing.nil?
        increasing = a < b
      elsif increasing && b < a
        bad_levels = true
        break
      elsif !increasing && a < b
        bad_levels = true
        break
      end

      difference = (b - a).abs
      if  difference < 1 || difference > 3
        bad_levels  = true
        break
      end
    end

    if bad_levels == false
      safe = true
    else
      dampened_safe = true
      (0...levels.count).each do |bad_level|
        dampened_levels = levels.dup
        dampened_levels.delete_at(bad_level)
        dampened_safe = true
        increasing = nil
        dampened_levels[0...-1].each_with_index do |a, i|
          b = dampened_levels[i + 1]

          if increasing.nil?
            increasing = a < b
          elsif increasing && b < a
            dampened_safe = false
            break
          elsif !increasing && a < b
            dampened_safe = false
            break
          end

          difference = (b - a).abs
          if  difference < 1 || difference > 3
            dampened_safe = false
            break
          end
        end
        safe = true if dampened_safe
      end
    end

    total += 1 if safe
  end
  puts total
end
