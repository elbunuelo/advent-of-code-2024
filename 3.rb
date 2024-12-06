NONE = 'none'
M = 'm'
U = 'u'
L = 'l'
OPEN = '('
NUM = /\d/
COMA = ','
CLOSE = ')'
D = 'd'
O = 'o'
N = 'n'
APOS = "'"
T = 't'

File.open('3.in') do |file|
  sum = 0
  current_state = {
    state: NONE,
    mul_enable: true,
    number: '',
    operand_1: nil,
    operand_2: nil,
    is_do: false,
    is_dont: false,
    is_mul: false,
  }
  def reset_state(current_state)
    current_state[:state] = NONE
    current_state[:number] = ''
    current_state[:operand_1] =  nil
    current_state[:operand_2] = nil
    current_state[:is_do] = false
    current_state[:is_dont] = false
    current_state[:is_mul] = false
  end
  file.each do |line|

    line.each_char do |c|
      if current_state[:state] == NONE
        if c == M
          current_state[:is_mul] = true
          current_state[:state] = M
          next
        end
        if c == D
          current_state[:state] = D
          next
        end
        reset_state current_state
        next
      elsif current_state[:state] == M
        if c == U
          current_state[:state] = U
          next
        end
        reset_state current_state
        next
      elsif current_state[:state] == U
        if c == L
          current_state[:state] = L
          next
        end
        reset_state current_state
        next
      elsif current_state[:state] == L
        if c == OPEN
          current_state[:state] = OPEN
          next
        end
        reset_state current_state
        next
      elsif current_state[:state] == OPEN
        if c =~ NUM
          current_state[:state] = NUM
          current_state[:number] += c
          next
        end

        if c == CLOSE
          current_state[:mul_enable] = true if current_state[:is_do]
          current_state[:mul_enable] = false if current_state[:is_dont]
          reset_state current_state
          next
        end
        reset_state current_state
        next
      elsif current_state[:state] == NUM
        if c =~ NUM && current_state[:number].length < 3
          current_state[:number] += c
          next
        end
        if c == COMA && current_state[:operand_1].nil?
          current_state[:operand_1] = current_state[:number].to_i
          current_state[:state] = COMA
          current_state[:number] = ''
          next
        end
        if c == CLOSE && current_state[:number].length > 0 && !current_state[:operand_1].nil?
          current_state[:operand_2] = current_state[:number].to_i

          sum += current_state[:operand_1] * current_state[:operand_2] if current_state[:mul_enable]
          reset_state current_state
          next
        end
        reset_state current_state
        next
      elsif current_state[:state] == COMA
        if c =~ NUM
          current_state[:state] = NUM
          current_state[:number] += c
          next
        end
        reset_state current_state
        next
      elsif current_state[:state] == D
        if c == O
          current_state[:state] = O
          next
        end
        reset_state current_state
        next
      elsif current_state[:state] == O
        if c == N
          current_state[:is_do] = false
          current_state[:is_dont] = true
          current_state[:state] = N
          next
        end
        if c == OPEN
          current_state[:is_do] = true
          current_state[:is_dont] = false
          current_state[:state] = OPEN
          next
        end
        reset_state current_state
        next
      elsif current_state[:state] == N
        if c == APOS
          current_state[:state] = APOS
          next
        end
        reset_state current_state
        next
      elsif current_state[:state] == APOS
        if c == T
          current_state[:state] = T
          next
        end
        reset_state current_state
        next
      elsif current_state[:state] == T
        if c == OPEN
          current_state[:state] = OPEN
          next
        end
        reset_state current_state
        next
      end
      reset_state current_state
    end
  end
  puts sum
end
