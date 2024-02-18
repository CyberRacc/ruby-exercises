def caesar_cipher(message, shift_by)

  # May need seperate if statements for if the letter is in upper case or lower case,
  # then adjust the calculation accordingly.

  message_ciphered = [] # Initialise the message_ciphered array as an empty array.

  message_array = message.split('') # Convert the string into an array, split by character.

  message_array.each do |substring|
    if substring.match?(/[A-Za-z]/) # If the substring is alphabetical
      message_ciphered.push((substring.ord + shift_by).chr)
      # If the final value of substring.ord + shift_by is greater than 26
      # Do the final value modulo % 26, this should wrap the characters back aroud the alphabet.
    else
      message_ciphered.push(substring) # If not alphabetical, i.e. spaces, etc. Push withou modification
    end
  end
  puts message_ciphered.join # output the final string to the console, joining the elements.
end

caesar_cipher("test", 5)
caesar_cipher("test", 6)
caesar_cipher("test", 3)

caesar_cipher("Testing again", 5)

caesar_cipher("idk if this is actually GOING to WORK but i will TRY!!", 2)

caesar_cipher("What a string!", 5)

caesar_cipher("If we use a lot of 'ZZZzzz' characters, they should wrap back around.", 6)
