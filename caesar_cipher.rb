def normalise_ascii_input(ascii_input)
  # Normalise the input number to a range between 0-25
  if ("A".ord.."Z".ord).include?(ascii_input)
    ascii_number = ascii_input - "A".ord
  elsif ("a".ord.."z".ord)
    ascii_number = ascii_input - "a".ord
  end

  if ascii_number > 25
    ascii_number %= 26
  end
  return ascii_number
end

def caesar_cipher(message, shift_by)

  # May need seperate if statements for if the letter is in upper case or lower case,
  # then adjust the calculation accordingly.

  message_ciphered = [] # Initialise the message_ciphered array as an empty array.

  message_array = message.split('') # Convert the string into an array, split by character.

  message_array.each do |substring|

    if substring.match?(/[A-Za-z]/)
      substring_ascii_number = substring.ord
      normalised_ascii_number = (normalise_ascii_input(substring_ascii_number) + "a".ord) + shift_by
      message_ciphered.push(normalised_ascii_number.chr)
    else
      message_ciphered.push(substring)
    end

  end

  puts message_ciphered.join # output the final string to the console, joining the elements.

end



caesar_cipher("A test", 5)
caesar_cipher("test", 6)
caesar_cipher("test", 3)

caesar_cipher("Testing again", 5)

caesar_cipher("idk if this is actually GOING to WORK but i will TRY!!", 2)

caesar_cipher("What a string!", 5)

caesar_cipher("If we use a lot of 'ZZZzzz' characters, they should wrap back around.", 6)
