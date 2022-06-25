# Q1

string = 'The Flintstones Rock!'
space = ''
count = 0

loop do 
  puts space + string
  space += ' '
  count += 1
  break if count == 10
end

# or alternatively, using #times method

10.times { |index| puts (' ' * index) + string }

# use multiply operator with string to copy it x times

# ===================================================== #

# Q2

# This will result in a type error as "the value of 40 + 2 is " is a string and
# (40 + 2) is an integer - (+) operator for string concatenation will not
# implicitly convert an integer into string to append to another string

# 2 ways to fix it... 

puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{40 + 2}"

# ===================================================== #

# Q3

def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

# the error occurs because divisor is allowed to reach 0, resulting in ZeroDivisionError
# the purpose of number % divisor == 0 is to ensure that the divisor can
# divide the number evenly without a remainder 
# the purpose of the second-to-last line is to return the array of factors, otherwise the
# return value will be nil

# ===================================================== #

# Q4 *** 

# there is no difference between the two in terms of the final result after one method invocation
# but they are different in terms of how they affect the input argument 
# the first code mutates the input argument when adding new_element, which will remain
# changed after the method is invoked
# whereas the second one concatenates the argument and the new element, and simply
# reassigns it to a different variable, without mutating the input argument
# so if the same arguments are to be repeatedly passed to the method,
# the method will result in different results 

# ===================================================== #

# Q5

# the limit variable is initialized outside the method definition, therefore inaccessible
# to the scope of the method 
# this can be fixed by (1) if appropriate, turning the limit variable into a constant,
# as a constant can be accessible from within an inner scope 
# or (2) pass the limit variable into another argument to the method

# ===================================================== #

# Q6

34

# ===================================================== #

# Q7 ***

# No, the family data did not get ransacked, as the method mess_with_demographis
# creates a new array consisting of the values that are nested hashes, 
# and makes changes on that array, saving the original data from getting affected 

# ... or so I thought, but turns out I'm wrong! hahahaha. Bad dog, Spot!
# so, because the initial argument passed to the method is the munsters original data,
# and since array#[]= is a setter method that mutates the caller, 
# the original data IS in fact affected and Spot is in big big trouble. 

# Remember, in Ruby, what gets passed to a method is NOT the value of the object
# it passes object_id of each argument into the method 
# so demo_hash parameter is a variable pointing to the munsters hash

# ===================================================== #

# Q8

# rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
# rps(rps("paper", "rock"), "rock")
# rps("paper", "rock")
# "paper"

# ===================================================== #

# Q9

"no"