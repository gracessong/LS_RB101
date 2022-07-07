arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end # => [1, 8, 11], [2, 6, 13], [2, 12, 15], [1, 8, 9]
end
# => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]

#3: #sort_by called on arr. No side effect. Returns the sorted array, not used
#3-7: outer block called on each sub-array as the argument. No side effect. Returns the sorted array to be
# used by the #sort_by in line 3
#4-6: inner block called on sub-array. No side effect. Returns the transformed array to be used by the outer block
#4: #map called on sub-array. No side effect. Returns the transformed sub-array, to be used by the outer block
#5: #to_i called on each element within the sub-array. No side effect. Returns integers, to be transformed by #map
