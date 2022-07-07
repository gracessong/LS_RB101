[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
# => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]

#1: #map called on the top-level array. No side effect. Returns the new transformed array, not used
#1-7: outermost block. No side effect. Returns the new transformed array to be used by #map
#2: #each called on the second-level sub-array. No side effect. Returns the original calling object, used
# by the outermost block for #map method
#3: #partition method called on third-level single-element sub-array. No side effect.
# Returns 2 arrays, the first one containing all 