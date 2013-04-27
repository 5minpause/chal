require 'xor'

# INPUT
# input = "Burning 'em, if you ain't quick and nimble\nI go crazy when I hear a cymbal"
input = "Cooking MC's like a pound of bacon"
hex_input = input.unpack('H*').to_s.hex

# KEY
key = "X" #"ICE"
key = key.to_s.unpack('H*').to_s.hex
key_length = key.to_s.length
# key = 4801349

expected_result = "0b3637272a2b2e63622c2e69692a23693a2a3c6324202d623d63343c2a26226324272765272a282b2f20430a652e2c652a3124333a653e2b2027630c692b20283165286326302e27282f"
result = []

hex_input.to_s.chars.to_a.each_slice(key_length) do |slice|
    result << (slice.join.to_i ^ key)
end

result = result.join
puts decipher_with_xor(result, 'X')
# cipher = '1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736'
# expected_result = expected_result.unpack('H*')
# puts expected_result

# puts decipher_with_xor(expected_result, 'ICE')