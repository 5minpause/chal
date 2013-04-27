require 'xor'

range = ('0'..'9').to_a+('a'..'z').to_a+('A'..'Z').to_a

f = File.read('task4_input')
f.each do |line|

	line = line.chars.to_a
	range.each do |i|
		text = decipher_with_xor(line, i)
	    scored_text = score_text(text)
    	puts scored_text if scored_text
	end

end	