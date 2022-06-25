# 1 

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# returns the original numbers array as #uniq does not mutate the caller
# with #puts each element is printed on a new line 

# ===================================================== #

# 2

# != indicates the operands before and after are not equal to each others
# this can be used as a part of conditional statmenets

# ! before something (i.e. !user_name) returns the boolean value opposite to the original value
# For example, if user_name equates to true or is a truthy value, then !user_name will be false

# ! after something (i.e. words.uniq!) indicates that the method mutates the caller

# ? before something/method indicates 

# ? after something can be a part of a ternary operator, making the expression before it the
# condition to be evaluated to return either true or false 
# if it comes at the end of a method, then it implies that the method will return a boolean value
# (true if a true object or a truthy value; false if not)

# !! (double bang operator) before something will return the double-negated Boolean value.
# for example, a truthy value preceded by !! will return true,
# whereas false or nill preceded by !! will return false
# therefore !! is used to turn any object into their boolean equivalent 

# ===================================================== #

# 3

advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub!('important', 'urgent')

# ===================================================== #

# 4

numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1) # will delete the object at index 1 => [1, 3, 4, 5]
numbers.delete(1) # will delete the object 1 => [2, 3, 4, 5]

# ===================================================== #

# 5

(10..100).include?(42)
(10..100).cover?(42)

# ===================================================== #

# 6

famous_words = "seven years ago..."

"Four score and " + famous_words
"Four score and " << famous_words
famous_words.prepend("Four score and ")

# ===================================================== #

# 7

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

flintstones.flatten! # => returns a single-dimensional array

# ===================================================== #

# 8 

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones.assoc("Barney") # => returns a two-element array ["Barney", 2]