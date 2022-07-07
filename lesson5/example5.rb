[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

#1: #map called on the array. No side effect. Return value = a new array of [[2, 4], [6, 8]], not used 
#1-5: outer block execution on each sub-array. No side effect. Returns the new transformed array to be used by the outer #map
#2-4: inner block execution. Returns integers 2, 4, 6, 8 over the two iterations over two sub-arrays, 
# which are used by the inner #map for transformation 
#2: #map called on the sub-array. No side effect. Return value = [[2, 4],[6, 8]], used by the outer block
#3: * method call on each element of the sub-array with integer 2 as an argument. No side effect. 
# Returns the integers 2, 4 for the iteration on the sub-array and 6, 8 for the iteration on the second sub-array, 
# used by the inner #map for transformation 