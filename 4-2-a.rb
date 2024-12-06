File.open('4.in') do |file|
  word_find = []
  width = 0
  file.each_line do |line|
    width = line.chomp.split('').size
    word_find << line.chomp.split('')
  end
  height = word_find.size
  total = 0

  def check_xmas(word_find, i, j)
    xmas = false
    height = word_find.size
    width = word_find[0].size

    if i + 2 < height && j + 2 < width &&
        (('M' == word_find[i][j] && 'A' == word_find[i + 1][j + 1] && 'S' == word_find[i + 2][j + 2]) ||
          ('S' == word_find[i][j] && 'A' == word_find[i + 1][j + 1] && 'M' == word_find[i + 2][j + 2]))

      if ('M' == word_find[i][j + 2] && 'A' == word_find[i + 1][j + 1] && 'S' == word_find[i + 2][j])
        xmas = true
      elsif ('S' == word_find[i][j + 2] && 'A' == word_find[i + 1][j + 1] && 'M' == word_find[i + 2][j])
        xmas = true
      end

      if xmas
        word_find[i][j] = '-'
        word_find[i + 1][j + 1] = '-'
        word_find[i + 2][j + 2] = '-'
        word_find[i][j + 2] = '-'
        word_find[i + 2][j] = '-'
      end
    end

    if i - 2 >= 0 && j - 2 >= 0 &&
        (('M' == word_find[i][j] && 'A' == word_find[i - 1][j - 1] && 'S' == word_find[i - 2][j - 2]) ||
        ('S' == word_find[i][j] && 'A' == word_find[i - 1][j - 1] && 'M' == word_find[i - 2][j - 2]))

      if ('M' == word_find[i][j - 2] && 'A' == word_find[i - 1][j - 1] && 'S' == word_find[i - 2][j])
        xmas = true
      elsif ('S' == word_find[i][j - 2] && 'A' == word_find[i - 1][j - 1] && 'M' == word_find[i - 2][j])
        xmas = true
      end

      if xmas
        word_find[i][j] = '-'
        word_find[i - 1][j - 1] = '-'
        word_find[i - 2][j - 2] = '-'
        word_find[i][j - 2] = '-'
        word_find[i - 2][j] = '-'
      end
    end

    if i - 2 >= 0 && j + 2 < width &&
        (('M' == word_find[i][j] && 'A' == word_find[i - 1][j + 1] && 'S' == word_find[i - 2][j + 2]) ||
        ('S' == word_find[i][j] && 'A' == word_find[i - 1][j + 1] && 'M' == word_find[i - 2][j + 2]))
      if ('M' == word_find[i - 2][j] && 'A' == word_find[i - 1][j + 1] && 'S' == word_find[i][j + 2])
        xmas = true
      elsif ('S' == word_find[i - 2][j] && 'A' == word_find[i - 1][j + 1] && 'M' == word_find[i][j + 2])
        xmas = true
      end

      if xmas
        word_find[i][j] = '-'
        word_find[i - 1][j + 1] = '-'
        word_find[i - 2][j + 2] = '-'
        word_find[i - 2][j] = '-'
        word_find[i][j + 2] = '-'
      end
    end

    if i + 2 < height && j - 2 >= 0 &&
        (('M' == word_find[i][j] && 'A' == word_find[i + 1][j - 1] && 'S' == word_find[i + 2][j - 2]) ||
        ('S' == word_find[i][j] && 'A' == word_find[i + 1][j - 1] && 'M' == word_find[i + 2][j - 2]))
      if ('M' == word_find[i][j - 2] && 'A' == word_find[i + 1][j - 1] && 'S' == word_find[i + 2][j])
        xmas = true
      elsif ('S' == word_find[i][j - 2] && 'A' == word_find[i + 1][j - 1] && 'M' == word_find[i + 2][j])
        xmas = true
      end

      if xmas
        word_find[i][j] = '-'
        word_find[i + 1][j - 1] = '-'
        word_find[i + 2][j - 2] = '-'
        word_find[i][j - 2] = '-'
        word_find[i + 2][j] = '-'
      end
    end

    xmas
  end

  word_find.each_with_index do |r, i|
    r.each_with_index do |c, j|
      total += 1 if check_xmas(word_find, i, j)
    end
  end

 word_find.each_with_index do |r, i|
   puts r.join('')
  end


  # (0...width).each do |j|
  #   (0...height).each do |i|
  #     xmas = check_xmas(word_find, i, j + i) if j + i < width
  #     total += 1 if xmas
  #   end
  # end
  #
  # (1...width).each do |j|
  #   (1...height).each do |i|
  #     xmas = check_xmas(word_find, i, i - j) if i - j >= 0
  #     total += 1 if xmas
  #   end
  # end
  #
  # (0...width).each do |j|
  #   (0...height).each do |i|
  #     xmas = check_xmas(word_find, j + i, height - 1 - i) if j + i < width && height - 1 - i >= 0
  #     total += 1 if xmas
  #   end
  # end
  #
  # (1...width).each do |j|
  #   (1...height).each do |i|
  #     xmas = check_xmas(word_find, i - j, height - 1 - i) if i - j >= 0 && height - 1 - i >= 0
  #     total += 1 if xmas
  #   end
  # end
  puts total
end
