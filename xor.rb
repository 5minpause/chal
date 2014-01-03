# require 'string'

# part1 = '1c0111001f010100061a024b53535009181c'
# part2 = '686974207468652062756c6c277320657965'
# result = '746865206b696420646f6e277420706c6179'

def bin_to_hex(s)
    s.unpack('H*').first.hex
end

def hex_to_bin(s)
    [s].pack('H*')
end

def hex_to_base64_digest(hexdigest)
  [[hexdigest].pack("H*")].pack("m0")
end

def xor_string(a, b)
    (a.join.hex ^ hexed_key).to_s(16)
end

def score_text(text)
    b = text.chars.to_a.inject(Hash.new(0)) {|h,i| h[i] += 1; h }
    if b['e'] > 0 && b['a'] > 0 && b['i'] > 0 && b['u'] > 0 && b['o'] > 0
        # puts "b['e']: #{b['e']}, b['a']: #{b['a']} b['i']: #{b['i']} "
        return text
    else
        return nil
    end
end

# result = []
# input.chars.each_with_index do |c, i|
#     result << (bin_to_hex(c) ^ bin_to_hex(key[i % key.length]))
# end

def decipher_text(input, key)
    result = []

    i = 0
    count = 0
    while i < input.length do
        result << ((input[i] + input[i+1]).hex ^ bin_to_hex(key[count % key.length])).to_s(16)
        i += bin_to_hex(key[count % key.length]).to_s.length
        count += 1
    end
    return hex_to_bin(result.join)
end

def encipher_text(input, key)
    result = []

    hex_input = bin_to_hex(input)
    # hex_input = input
    i = 0
    count = 0
    while i < hex_input.to_s.length do
        result << ((hex_input[i].to_s(16) + hex_input[i+1].to_s(16)).hex ^ bin_to_hex(key[count % key.length])).to_s(16)
        i += bin_to_hex(key[count % key.length]).to_s.length
        count += 1
    end
    
    # hex_input.chars.each_slice(key_length) do |slice|
    #   # puts "#{slice.join.hex}".length
    #   if key_length < "#{slice.join.hex}".length
    #     div, mod = "#{slice.join.hex}".length.divmod(key_length)
    #     actual_key = key * div + key[0, mod]
    #   else
    #     actual_key = key
    #   end
    #   intermediate = (slice.join.hex ^ actual_key)
    #   result << intermediate.to_s(16)
    # end

    return hex_to_base64_digest(result.join)
end
