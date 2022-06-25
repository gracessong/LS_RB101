# Q1 ***

# if statement does not create a scope, so therefore there will be no error raised 
# for undefined local variable. The variable greeting will be accessible outside the if block.
# However, if block will not get executed, as there is no condition specified for "false" 
# and it will always be "truthy" otherwise 
# Therefore, greeting does not get assigned to the object "hello world",
# and its value will be nil by default 

# ===================================================== #

# Q2 ***

# the greetings[:a] is bound to the object 'hi'
# informal_greeting is a new variable pointing to the object 'hi'
# line 3 mutates the object referenced by informal_greeting to 'hi there', which is still
# also bound to greetings[:a]
# therefore, greetings[:a]'s new value is 'hi there'
# the output will be { a: 'hi' }

# how, then, can we work with hash without modifying the original object?
# instead of using String#<<, use String#+ for concatenation, and reassign it to the variable
# or informal_greeting = greeting[:a].clone method

# ===================================================== #

# Q3

# A) 

def mess_with_vars(one, two, three) 
  one = two # <= reassigning to a local variable but all within the scope of method definition
  two = three # these variables are NOT the same as the variables with the same names outside the scope
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # => "one"
puts "two is: #{two}" # => "two"
puts "three is: #{three}" # => "three"

# B)

def mess_with_vars(one, two, three)
  one = "two" # the method's local variable one is pointing to string object "two"
  two = "three" # but all live only within this scope of method definition
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # => "one"
puts "two is: #{two}" # => "two"
puts "three is: #{three}" # => "three"

# C)

def mess_with_vars(one, two, three)
  one.gsub!("one","two") # these methods mutate the callers 
  two.gsub!("two","three") # arguments passed to the method now point to different string objects
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # => "two"
puts "two is: #{two}" # => "three"
puts "three is: #{three}" # => "one"

# ===================================================== #

# Q4

# include a false condition - i.e. what makes the method return false?
# handle edge cases where the number of components to the IP addresses varies -> should be invalid

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated.words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(number) # can use 'return' within loop in method definition
    # as the code stops executing after 'return' command 
  end
  
  true
end
