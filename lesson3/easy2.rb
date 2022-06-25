# Q1 

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.key?("Spot")
ages.include?("Spot")
ages.member?("Spot") # => all test to see if key "Spot" is present

# ===================================================== #

# Q2

munsters_description = "The Munsters are creepy in a good way."

munsters_description.swapcase! # => "tHE mUNSTERS ARE CREEPY IN A GOOD WAY"
munsters_description.capitalize! # => "The munsters are creepy in a good way"
munsters_description.downcase! # => "the munsters are creepy in a good way"
munsters_description.upcase! # => "THE MUNSTERS ARE CREEPY IN A GOOD WAY"

# ===================================================== #

# Q3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages) # => adds additional_age to ages

# ===================================================== #

# Q4

advice = "Few things in life are as important as house training your pet dinosaur."

advice.include?("Dino") # => false; does not include the name "Dino"
advice.match?("Dino") # => false; does not include the name "Dino"

# ===================================================== #

# Q5

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles) 
# => flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

# ===================================================== #

# Q6 

flintstones << "Dino" 
flintstones.push("Dino")
# => both add "Dino" to the array

# ===================================================== #

# Q7

flintstones.push("Dino", "Hoppy")
flitnstones.concat("Dino", "Hoppy")
# => adding multiple elements to the array

# ===================================================== #

# Q8

advice = "Few things in life are as important as house training your pet dinosaur."

advice.slice!(0..38) # => returns the deleted substring "Few things...as "
advice # => returns "house...dinosaur."

# ===================================================== #

# Q9 

statement = "The Flintstones Rock!"

statement.count('t') # => counts the number of 't' in the string

# ===================================================== #

# Q10

title = "Flintstone Family Members"

title.center(40) => # centers the title within 40-character space 
