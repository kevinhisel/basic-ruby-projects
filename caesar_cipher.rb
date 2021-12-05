def caesar_cipher(string, shift_amount)
  shift_amount %= 26

  string.chars.map do |c| 
    new_c = c.ord
    if new_c.between?(65, 90)
      if new_c + shift_amount > 90 ? new_c += (shift_amount - 26) : new_c += shift_amount
      end
    end

    new_c.chr
  end.join
end

caesar_cipher('Z', 1)