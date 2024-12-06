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
    height = word_find.size
    width = word_find[0].size

    return false if word_find[i][j] != 'A'

    if i - 1 < 0 || j - 1 < 0 || i + 1 >= height || j + 1 >= width
      return false
    end

    if (((word_find[i - 1][j - 1] == 'M' && word_find[i + 1][j + 1] == 'S') ||
                    (word_find[i - 1][j - 1] == 'S' && word_find[i + 1][j + 1] == 'M')) &&
        ((word_find[i - 1][j + 1] == 'M' && word_find[i + 1][j - 1] == 'S') ||
                     (word_find[i - 1][j + 1] == 'S' && word_find[i + 1][j - 1] == 'M')))

       true
    end
  end

  word_find.each_with_index do |r, i|
    r.each_with_index do |c, j|
      total += 1 if check_xmas(word_find, i, j)
    end
  end

  puts total
end
