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

  total = 0
  updates.each do |update|
    correct = true
    update.each_with_index do |page, index|
      (index...update.length).each do |j|
        subsequent_page = update[j]
        found = ordering.index do |order|
          order == [subsequent_page, page]
        end
        correct = false if found
      end
    end
    total += update[(update.length - 1)/2].to_i if correct
  end
  puts total
end
