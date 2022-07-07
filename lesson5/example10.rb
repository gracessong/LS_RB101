[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end

# => [[[2, 3], [4, 5]], [6, 7]]

#1: #map called on the top-level array. Returns the transformed array. Not used
#2-10: inner block
#2: #map called on the second-level sub-array. Returns the transformed sub-array. 
# Return value used for the outer block
#3-9: conditional statement on the elements of the second-level sub-array [1, 2],
# [3, 4], 5, 6. No side effects. Returns incremented integers if element is integer,
# or a transformed sub-arrays [2, 3], [4, 5] if element is an array. Used by the inner
# block for #map transformation

