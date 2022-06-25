# Q1

# the last line of the block is the string 'hi', which is the return value of the block
# 'hi' is a truthy value, and therefore meets the criteria to be selected
# the return value is ['hi', 'hi', 'hi']

# NOOOPE JUST KIDDING

# since #selects picks the original element, the return value is 
# => [1, 2, 3], the original collection

# =================================================== #

# Q2

# With Array#count, when the block is given, it counts the number of elements that
# is evaluated by the block to be "truthy"
# => 2

# =================================================== #

# Q3

# Array#reject returns a new array containing the elements for which the block return
# value is not "truthy"
# in this code, the last code in the block will return 'nil', 
# therefore => [1, 2, 3]

# =================================================== #

# Q4

# Enumerable#each_with_object returns the initially given object, as it does not
# consider the return value of the block 
# => ['ant', 'bear', 'cat']

# ...but NO THIS IS NOT CORRECT!!!! 

# the initial object {} passed into the method is updated by the block return values
# and it is THIS "initially given object" that is the final method return value
# => {'a' => 'ant', 'b' => 'bear', 'c' => 'cat'}

# =================================================== #

# Q5

# hash#shift removes the first key-value pair and returns it in a [key, value] array 
# => [a:, 'ant']
# the hash is destructively changed

# =================================================== #

# Q6

# Array#pop method permanently removes the last element from the array 
# and returns it. Chaining #size method therefore returns the length of characters for
# the popped element 'caterpillar', which is => 11

# =================================================== #

# Q7

# the last code executed in the block is num.odd? which will give a boolean value for
# each iterated element (=> true, false, true)
# Enumerable#any? returns true if any of the block's return values is truthy 
# therefore, the final return value will be => true

# BUT DON'T FORGET ABOUT PUTS NUM !!!!!! 

# since the block returns 'true' on the first iteration, 
# the method will stop after the first iteration, and therefore #puts will only
# be executed once => the output will be '1' 

# =================================================== #

# Q8

# array#take accepts an integer as an argument, and returns the corresponding
# number of elements from the array 
# the doc doesn't explicitly indicate if it destructively changes or not,
# but you can check by p arr to see if arr has changed
# and after doing so, I can say with confidence that it does NOT destructively change

# =================================================== #

# Q9

# Enumerable#map returns a new array collection containing elements that have been
# transformed using the block; it considers the block return value 
# In this case, the block return value is 'bear'
# therefore the method will return => ['bear']

# BUT NOOOOO 

# remember, #map is NOT #select, and it iterates on EACH and EVERY element 
# so, since the first iteration returns 'nil' ('ant' does not evaluate true to if statement)
# the method will return => [nil, 'bear']

# =================================================== #

# Q10

# for the first iteration, block returns 1
# for the second iteration, block returns nil (since 2 > 1 and puts num returns nil)
# for the third iteration, block returns nil (since 3 > 1 and puts num returns nil)
# therefore, the method will return => [1, nil, nil]