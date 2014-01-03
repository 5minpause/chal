require_relative 'xor'

# input = "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"

input = "0b3637272a2b2e63622c2e69692a23693a2a3c6324202d623d63343c2a26226324272765272a282b2f20430a652e2c652a3124333a653e2b2027630c692b20283165286326302e27282f"
input2 = "Burning 'em, if you ain't quick and nimble\n I go crazy when I hear a cymbal\n"


# key = "X"
key = "ICE"

result = []

# i = 0
# count = 0
# while i < input.length do
# 	result << ((input[i] + input[i+1]).hex ^ bin_to_hex(key[count % key.length])).to_s(16)
# 	i += 2
# 	count += 1
# end

# input.chars.each_slice(2) do |slice|
# 	# p input.index(slice.last)
#     # result << (slice.join.hex ^ hexed_key).to_s(16) #    bin_to_hex(key[i % key.length]))
# end

# puts result.join

# puts hex_to_bin(result.join)
puts decipher_text(input, key)
puts encipher_text(input2, key)
