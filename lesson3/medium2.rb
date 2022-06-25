# Q1

a = "forty two"
b = "forty two"
c = a

# a.object_id will be different from b.object_id, as two variables can have the same value
# but point to different places in memory space and therefore two different objects 
# the variable c is a pointer to the variable a, which points to 'forty two'
# so a and c will share the object_id of the object 'forty two'

# ===================================================== #

# Q2

a = 42
b = 42
c = a 

# a.object_id and b.object_id will be the same, as they both point to the immutable integer object '42',
# c is a pointer to variable a, which points to the object '42', so c.object_id will also be
# the same as the rest 

# ===================================================== #

# Q3

# my_string will not have changed, because String#+= does not mutate the string itself,
# but creates a new object that is now "pumpkinsrutabaga" and binds to it
# my_array will look like ["pumpkins", "rutabaga"], because the concatenation method Array#<< will 
# mutate the original array 

# ===================================================== #

# Q4

# in this version, String#<< mutates the caller, so my_string will be "pumpkinsrutabaga"
# however, when my_array is passed as an argument to the method, and binds to the local
# variable an_array_param which is bound to a new object, this is only occurring within the 
# scope of the method 

# ===================================================== #

# Q6

def color_valid(color)
  color == "blue" || color == "green"
end



# takeaways...
# definitely need to reinforce the concepts of mutability vs immutability, pass by reference vs
# pass by value 
# and get in the habit of thinking how a method affects the argument 