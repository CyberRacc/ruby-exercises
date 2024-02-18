def normalise_ascii_input(ascii_input)
  # Normalise the input number to a range between 0-25
  if ("A".ord.."Z".ord).include?(ascii_input)
    ascii_number = ascii_input - "A".ord
  elsif ("a".ord.."z".ord).include?(ascii_input)
    ascii_number = ascii_input - "a".ord
  end
  return ascii_number
end

def caesar_cipher(message, shift_by)
  # May need seperate if statements for if the letter is in upper case or lower case,
  # then adjust the calculation accordingly.

  message_ciphered = [] # Initialise the message_ciphered array as an empty array.

  message_array = message.split('') # Convert the string into an array, split by character.

  # Iterate over each character from the provided string.
  message_array.each do |substring|
    if substring.match?(/[A-Za-z]/)
      substring_ascii_number = substring.ord
      normalised_ascii_number = normalise_ascii_input(substring_ascii_number)
      shifted_number = (normalised_ascii_number + shift_by) % 26 # Always modulo by 26 to ensure wrapping with any number
      shifted_number += 26 if shifted_number < 0

      # Convert the normalised values back to their
      if ("A".ord.."Z".ord).include?(substring_ascii_number)
        shifted_number += "A".ord
      elsif ("a".ord.."z".ord).include?(substring_ascii_number)
        shifted_number += "a".ord
      end

      message_ciphered.push(shifted_number.chr)
    else
      message_ciphered.push(substring)
    end
  end
  return message_ciphered.join # output the final string to the console, joining the elements.
end


# Moved to caesar_cipher_test.rb
#
# # Run Tests
# puts caesar_cipher("A test", 5)
# puts caesar_cipher("test", 6)
# puts caesar_cipher("test", 3)
# puts caesar_cipher("Testing again", 5)
# puts caesar_cipher("idk if this is actually GOING to WORK but i will TRY!!", 2)
# puts caesar_cipher("What a string!", 5)
# puts caesar_cipher("If we use a lot of 'ZZZzzz' characters, they should wrap back around.", 6)
# puts caesar_cipher("If we use a lot of 'ZZZzzz' characters, they should wrap back around.", -2)
# puts caesar_cipher("If we use a lot of 'ZZZzzz' characters, they should wrap back around.", 0)
# puts caesar_cipher("If we use a lot of 'ZZZzzz' characters, they should wrap back around.", 29)
