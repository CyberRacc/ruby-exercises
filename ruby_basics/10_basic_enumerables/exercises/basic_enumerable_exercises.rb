require 'pry-byebug'

def display_current_inventory(inventory_list)
  # use #each to iterate through each item of the inventory_list (a hash)
  # use puts to output each list item "<key>, quantity: <value>" to console
  inventory_list.each { |item_key, item_value| puts "#{item_key}, quantity: #{item_value}" }
end

def display_guess_order(guesses)
  # use #each_with_index to iterate through each item of the guesses (an array)
  # use puts to output each list item "Guess #<number> is <item>" to console
  # hint: the number should start with 1
  guesses.each_with_index do |guess, index|
    # binding.pry
      puts "Guess ##{index + 1} is #{guess}"
  end
end

def find_absolute_values(numbers)
  # use #map to iterate through each item of the numbers (an array)
  # return an array of absolute values of each number
  numbers.map { |number| number.abs }
end

def find_low_inventory(inventory_list)
  # use #select to iterate through each item of the inventory_list (a hash)
  # return a hash of items with values less than 4
  inventory_list.select { |key, value| value < 4 }
end

# use #reduce to iterate through each item of the word_list (an array)
# return a hash with each word as the key and its length as the value
# hint: look at the documentation and review the reduce examples in basic enumerable lesson
# def find_word_lengths(word_list)
#   # The `reduce` method is called on the word_list array.
#   # It starts with an empty hash (Hash.new) as its initial accumulator value.
#   word_list.reduce(Hash.new) do |acc, word|
#     # Inside the block, for each element of the array (each `word`),
#     # we set a key in the accumulator hash (`acc`) equal to the word,
#     # and its value to the length of the word (`word.length`).
#     acc[word] = word.length

#     # It's crucial to return the accumulator (acc) at the end of the block.
#     # This updated accumulator is then used in the next iteration.
#     acc
#   end
#   # After `reduce` has iterated through all the elements, the final hash is returned.
# end

def find_word_lengths(word_list)
  # Start with `reduce` on the word_list array. Use an empty hash as the starting point.
  word_list.reduce(Hash.new) do |lengths_hash, current_word|
    # For each word in the array:
    # - `lengths_hash` is our accumulator, the hash we're building.
    # - `current_word` is the word currently being iterated over.

    # Set the current word as a key in our hash, with its value being its length.
    lengths_hash[current_word] = current_word.length

    # Return the updated hash to be used in the next iteration of `reduce`.
    # This step is crucial for `reduce` to work correctly, as it relies on the
    # accumulator value being passed through each iteration.
    lengths_hash
  end
  # Once all words have been processed, the final hash is automatically returned
  # by `reduce`, mapping each word to its length.
end
