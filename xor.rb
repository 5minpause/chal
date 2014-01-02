# require 'string'

# part1 = '1c0111001f010100061a024b53535009181c'
# part2 = '686974207468652062756c6c277320657965'
# result = '746865206b696420646f6e277420706c6179'

def score_text(text)
    b = text.chars.to_a.inject(Hash.new(0)) {|h,i| h[i] += 1; h }
    if b['e'] > 0 && b['a'] > 0 && b['i'] > 0 && b['u'] > 0 && b['o'] > 0
        # puts "b['e']: #{b['e']}, b['a']: #{b['a']} b['i']: #{b['i']} "
        return text
    else
        return nil
    end
end

def decipher_with_xor(cipher, key)
    result = []
    b = key.to_s.unpack('H*')[0].hex
    key_length = b.to_s.length

    if cipher.class != Array
        cipher = cipher.to_s.chars
    end

    cipher.each_slice(key_length) do |bit|
        result << ( bit.join.hex ^ b ).to_s(16)
    end

    text = [result.join].pack('H*')
    
    # these last two lines encrypt and decrypt result.join again
    # so they are unneccessary

    # t = text.unpack('H*')
    # [t.join].pack('H*')
end

def encipher_with_xor(input, key)
    result = []

    if key.length < input.length
      div, mod = input.length.divmod(key.length)
      key = key * div + key[0, mod]
    end

    key = key.to_s.unpack('H*')[0].hex
    key_length = key.to_s.length

    hex_input = input.unpack('H*')[0]

    hex_input.chars.each_slice(key_length) do |slice|
      intermediate = (slice.join.hex ^ key)
      result << intermediate.to_s(16)
    end

    return result.join
end
