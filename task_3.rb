require 'xor'

cipher = '1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736'

range = ('0'..'9').to_a+('a'..'z').to_a+('A'..'Z').to_a

cipher = cipher.chars.to_a

range.each do |i|

    text = decipher_with_xor(cipher, i)
    scored_text = score_text(text)
    puts scored_text if scored_text

end