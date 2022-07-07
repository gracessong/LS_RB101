my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

# 18
# 7
# 12
# => [[18, 7], [3, 12]]

#1: my_arry variable assigned to the output of #each method, no side effect, returns the output of #each method [[18, 7], [3, 12]], not used
#1: #each called on the array. No side effect. Returns the originally called object, used by variable assignment to my_arr
#1-7: outer block execution
#2-6L: inner block execution 
#2: #each method called on the the sub-array. No side effect. Returns the originally called object which is the sub-array, used for outer block execution
#3: comparison between the element of the subarray in iteration and 5. No side effect. Returns boolean value, used by if statement
#3: conditional expression on each element within the sub-array. No side effect. Returns true/false, used to execute line 4
#4: #puts called on the element within the sub-array that is bigger than 5. Outputs the string integer. Returns nil, used to determine the return value of the conditional statement if the condition is met
