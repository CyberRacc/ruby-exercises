def blank_seating_chart(number_of_rows, seats_per_row)
  # return a 2d array to represent a seating chart that contains
  # number_of_rows nested arrays, each with seats_per_row entries of nil to
  # represent that each seat is empty.

  # Example: blank_seating_chart(2, 3) should return:
  # [
  #   [nil, nil, nil],
  #   [nil, nil, nil]
  # ]

  # NOTE: if one of the nested arrays is changed, the others should **not**
  # change with it
  Array.new(number_of_rows) { Array.new(seats_per_row) }
end

def add_seat_to_row(chart, row_index, seat_to_add)
  # take a chart (2d array)  and add seat_to_add to the end of the row that is
  # at row_index index of the chart, then return the chart
  chart[row_index].push(seat_to_add)
  chart
end

def add_another_row(chart, row_to_add)
  # take a chart and add row_to_add to the end of the chart,
  # then return the chart.
  chart << row_to_add
  chart
end

def delete_seat_from_row(chart, row_index, seat_index)
  # The `delete_at` method is used here to specifically target and remove an element
  # from the array at a given index. In this context, `chart[row_index]` accesses
  # the row within the chart (which is a 2D array), and `delete_at(seat_index)`
  # removes the seat at the specified `seat_index` within that row.
  #
  # This is effective for a few reasons:
  # 1. Precision: Unlike `pop`, which only removes the last element of an array,
  #    `delete_at` allows us to specify exactly which element to remove based on its index.
  #    This is crucial since we need to delete a specific seat, not necessarily the last one.
  #
  # 2. Modification In Place: `delete_at` modifies the array in place, directly
  #    removing the element and shifting the remaining elements to fill the gap.
  #    This ensures the row reflects the change immediately without needing to
  #    reassign or manually adjust the array.
  #
  # 3. Safety: If the `seat_index` is out of the array's bounds (e.g., too high or negative),
  #    `delete_at` will return `nil` and not modify the array, which prevents errors
  #    from trying to delete non-existent elements.
  #
  # After using `delete_at` to remove the specified seat, the entire chart (with the
  # updated row) is returned. This ensures that the caller receives the modified seating chart,
  # reflecting the deletion that was made.
  chart[row_index].delete_at(seat_index)

  # Return the updated chart. This step is crucial as it ensures that the method
  # fulfills its responsibility by providing the modified chart, not just the result
  # of the `delete_at` operation (which would be the deleted seat or `nil`).
  chart
end


def delete_row_from_chart(chart, row_index)
  # take a chart and delete the row at row_index of the chart,
  # then return the chart
  chart.delete_at(row_index)
  chart
end

def count_empty_seats(chart)
  # take a chart and return the number of empty (nil) seats in it

  # NOTE: `chart` should **not** be mutated
  nil_count = 0

  chart.each do |chart_row|
    nil_value = chart_row.count { |seat| seat == nil }
    nil_count += nil_value
  end
  return nil_count
end

# def find_favorite(array_of_hash_objects)
#   # take an array_of_hash_objects and return the hash which has the key/value
#   # pair :is_my_favorite? => true. If no hash returns the value true to the key
#   # :is_my_favorite? it should return nil

#   # array_of_hash_objects will look something like this:
#   # [
#   #   { name: 'Ruby', is_my_favorite?: true },
#   #   { name: 'JavaScript', is_my_favorite?: false },
#   #   { name: 'HTML', is_my_favorite?: false }
#   # ]

#   # TIP: there will only be a maximum of one hash in the array that will
#   # return true to the :is_my_favorite? key
#   favorite_hash = nil
#   array_of_hash_objects.each do |hash_object|
#     if hash_object[:is_my_favorite?] == true
#         favorite_hash = hash_object
#     end
#   end
#   return favorite_hash
# end

def find_favorite(array_of_hash_objects)
  # Initialize `favorite_hash` to `nil` to have a default return value
  # in case no favorite is found in the loop.
  favorite_hash = nil

  # Iterate over each hash in the array `array_of_hash_objects`.
  array_of_hash_objects.each do |hash_object|
    # Check if the current hash has the key `:is_my_favorite?` set to true.
    if hash_object[:is_my_favorite?] == true
        # If so, set `favorite_hash` to the current hash because it meets the criteria
        # of being the favorite. This will overwrite `favorite_hash`'s previous value.
        favorite_hash = hash_object
        # No need to explicitly break since we continue to look through each hash
        # but knowing there's at most one favorite, this assignment will only happen once.
    end
    # If the condition is not met, do nothing and proceed to the next hash object.
  end

  # Return `favorite_hash`, which will be either the first hash object found with
  # `:is_my_favorite?` set to true, or `nil` if no such hash was found.
  return favorite_hash
end
