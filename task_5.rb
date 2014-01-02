require_relative 'xor'

# INPUT
input = "Burning 'em, if you ain't quick and nimble I go crazy when I hear a cymbal"
# input = "Cooking MC's like a pound of bacon"

# KEY
key = "ICE"
# key = 'X'

expected_result = "0b3637272a2b2e63622c2e69692a23693a2a3c6324202d623d63343c2a26226324272765272a282b2f20430a652e2c652a3124333a653e2b2027630c692b20283165286326302e27282f"

en = encipher_with_xor(input, key)

de = decipher_with_xor(en, key)
puts de
if expected_result == en
	puts "YES"
else
	puts "NO"
	puts expected_result
	puts en
end

# de = decipher_with_xor(en, key)

# result = result.join
# puts result
# puts [result].pack('H*')
# puts decipher_with_xor(result, 'X')
# cipher = '1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736'
# expected_result = expected_result.unpack('H*')
# puts expected_result

# puts decipher_with_xor(expected_result, 'ICE')

# steps to encrypt :

#  - input_string.unpack("H*")
