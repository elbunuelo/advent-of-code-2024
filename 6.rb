File.open('6.in') do |file|
  map = []
  starting_row = 0
  starting_col = 0
  file.lines.each_with_index do |line, row|
    map << line.chomp.split('')
    caret_position = line.index '^'
    starting_col = caret_position if caret_position
    starting_row = row if caret_position
  end

  current_row = starting_row
  current_col = starting_col
  direction = :up
  positions = 1

  while true
     if map[current_row][current_col] == '.'
       positions += 1
       map[current_row][current_col] = 'X'
     end

    if direction == :up
      break if current_row == 0
      if map[current_row - 1][current_col] == '#'
        direction = :right
      else
        current_row -= 1
      end
    elsif direction == :down
      break if current_row == map.length - 1
      if map[current_row + 1][current_col] == '#'
        direction = :left
      else
        current_row += 1
      end
    elsif direction == :left
      break if current_col == 0
      if map[current_row][current_col - 1] == '#'
        direction = :up
      else
        current_col -= 1
      end
    elsif direction == :right
      break if current_col == map[0].length - 1
      if map[current_row][current_col + 1] == '#'
        direction = :down
      else
        current_col += 1
      end
    end


  end
  puts positions

end
