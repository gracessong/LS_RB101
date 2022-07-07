[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item    # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end
# => [[27], ["apple"]]

#1: #map called on the nested array. No side effect. Returns the new transformed array containing elements
# that meet the criteria. Not used further
#1-9: outer block called on each sub-array. No side effect. Returns the transformed sub-array to be used by
# the top-level #map for transformation into an array
#2-8: inner block called on each sub-array. No side effect. Returns integers when iterating over the first
# sub-array and strings when iterating over the second sub-array that meet the criteria. Return values used
# by the outer block.
#2: #select called on the sub-array. No side effect. Returns element/elements from each sub-array that 
# meet the criteria to be used by the outer block.
#3: comparison == between two arguments, the item and the item converted into an integer. Returns boolean, to
# be used by the if statement.
#3: #to_s and #to_i chained methods called on the element of the sub-array. No side effect. Returns integer, 
# to be used by the comparison method 
#3-7: conditional block called on the boolean value returned from the comparison method. No side effect. 
# Returns boolean values, to be used by the #select in the inner block