[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

# 1
# 3
# => [1, 3]

#1: #map called on the array. No side effect. Returns a new array [1, 3], not used. 
#1-4: block execution on each sub-array. No side effect. Returns the element at index 0 of sub-array, used by map
#2: #first called on the sub-array. No side effect. Returns the elemtn at index 0 of sub-array, used by #puts
#2: #puts called on the element at index 0 of sub-array. Outputs a stirng integer. Returns nil, not used
#3: same as #2 but the return value now used by the block 
