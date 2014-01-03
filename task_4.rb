require_relative 'xor.rb'

range = ('0'..'9').to_a+('a'..'z').to_a+('A'..'Z').to_a

f = File.open('task4_input', 'r')
f.each_line do |line|

  # line = line.chars.to_a
  range.each do |i|
    text = decipher_text(line, i)
    scored_text = score_text(text)
    puts scored_text if scored_text
  end
end
