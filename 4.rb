SEARCH = 'XMAS'
File.open('4.in') do |file|
  word_find = []
  width = 0
  file.each_line do |line|
    width = line.chomp.split('').size
    word_find << line.chomp.split('')
  end
  height = word_find.size

  haystack = ''
  word_find.each { |r| haystack += "#{r.join('')} #{r.reverse.join('')} " }
  word_find.transpose.each { |r| haystack += "#{r.join('')} #{r.reverse.join('')} " }


  (0...width).each do |j|
    diagonal = []
    (0...height).each do |i|
      diagonal << word_find[i][j + i] if j + i < width
    end
    haystack += "#{diagonal.join('')} #{diagonal.reverse.join('')} "
  end

  (1...width).each do |j|
    diagonal = []
    (1...height).each do |i|
      diagonal << word_find[i][i - j] if i - j >= 0
    end
    haystack += "#{diagonal.join('')} #{diagonal.reverse.join('')} "
  end

  (0...width).each do |j|
    diagonal = []
    (0...height).each do |i|
      diagonal << word_find[j + i][height - 1 - i] if j + i < width && height - 1 - i >= 0
    end
    haystack += "#{diagonal.join('')} #{diagonal.reverse.join('')} "
  end

  (1...width).each do |j|
    diagonal = []
    (1...height).each do |i|
      diagonal << word_find[i - j][height - 1 - i] if i - j >= 0 && height - 1 - i >= 0
    end
    haystack += "#{diagonal.join('')} #{diagonal.reverse.join('')} "
  end

  puts haystack.scan(/#{SEARCH}/).size
end
