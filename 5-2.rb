File.open('5.in') do |file|
  processing_ordering = true
  ordering = []
  updates = []
  file.each_line do |line|
    if line.chomp == ''
      processing_ordering = false
      next
    end
    if processing_ordering
      ordering << line.chomp.split('|')
    else
      updates << line.chomp.split(',')
    end
  end

  def is_correct?(ordering, update)
    update.each_with_index do |page, index|
      (index...update.length).each do |j|
        subsequent_page = update[j]
        found = ordering.index do |order|
          order == [subsequent_page, page]
        end

        return false if found
      end
    end
    true
  end

  def fix_update(ordering, update)
    while !is_correct?(ordering, update)
      update.each_with_index do |page, index|
        (index...update.length).each do |j|
          subsequent_page = update[j]
          found = ordering.index do |order|
            order == [subsequent_page, page]
          end
          if found
            update[index], update[j] = update[j], update[index]
            break
          end
        end
      end
    end
    update
  end

  incorrect_updates = []
  updates.each do |update|
    incorrect_updates << update unless is_correct? ordering, update
  end

  total = 0
  incorrect_updates.each do |update|
    fix_update ordering, update
    total += update[(update.length - 1)/2].to_i
  end
  puts total
end
