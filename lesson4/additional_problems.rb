# Q1 

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones.each_with_object({}) do |name, hash|
  hash[name] = flintstones.find_index(name)  
end 

# =================================================== #

# Q2

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

total_age = 0
ages.each { |_, age| total_age += age }
p total_age

# =================================================== #

# Q3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if { |_, age| age >= 100 }

# =================================================== #

# Q4

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.values.min

# =================================================== #

# Q5

# loop through the array
# for each element, check to see if it starts with "Be"
# if it does, assign the index to the index variable and break

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

index_name = nil

flintstones.each_with_index do |name, index|
  if name.start_with?('Be')
    index_name = index
    break
  end
end

index_name

# alternatively... 

flintstones.index { |name| name.start_with?("Be")}

# =================================================== #

# Q6

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map { |name| name[0, 3] }

# =================================================== #

# Q7

# Problem #
# input: string
# output: hash { each letter => frequency }
# Explicit rules: 
# - return a hash
# Implicit rules:
# - case-sensitive
# - only count for each unique letter 
# - spaces are not counted

# Algorithm #
# 1. split the string into an array of characters, without spaces
# 2. get rid of any duplicate letters, and store this array as a letter_list variable
# 3. iterate through the letter_list variable
# 4. for each iteration, count the number of times the element appears in the original array 
# 5. store it in hash key-value form
# 6. return the hash 

statement = "The Flintstones Rock"
character_array = statement.delete(' ').chars
letter_list = character_array.uniq
letter_count = {}

letter_list.each do |letter|
  letter_frequency = character_array.count(letter)
  letter_count[letter] = letter_frequency
end

letter_count 

# =================================================== #

# Q8

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# for the first iteration, the first line of block will print 1
# the last line of the block removes the first element then returns the removed element
# the return value of the last line would not matter, but the array has now been modified to [2, 3, 4]
# for the second iteration, it will be on the index = 1 of the now modified array
# therefore the first line of block prints 3
# the last line of block removes 2, leaving numbers = [3, 4]
# the third iteration will be on index = 2, which does not exist in the new modified array
# therefore the iteration ends here, returning the modified numbers array = [3, 4]

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# for the first iteration, the first line of block prints 1
# the last code removes the last element, leaving [1, 2, 3], then returns the removed element
# the second iteration on index = 1 runs on the element 2 of [1, 2, 3]
# the first line prints 2, then last line removes 3, leaving [1, 2]
# the third iteration would be on index = 2, which is out of boundaries for the modified array,
# and the iteration ends here
# the final method returns [1, 2]

# =================================================== #

# Q9

# 1. split the string into an array of substrings, initialize titleized array
# 2. iterate through the array of substrings
# 3. for each substring, capitalize or upcase the first letter, and append to titleized array
# 4. join the titleized array

def titleize(string)
  titleized_array = []
  substrings = string.split

  substrings.each { |substring| titleized_array << substring.capitalize }

  titleized_array.join(' ')
end

titleize("the flintstones rock")

# or alternatively.. since it's about TRANSFORMATION for each element, 
# #map can be used to shorten the code

def titleize(string)
  string.split.map{ |substring| substring.capitalize }.join(' ')
end

# =================================================== #

# Q10

# 1. iterate through the munsters array using #map
# 2. for each name, add age_group key
# 3. the value of age_group key will be 'kid' if age 0-17, 'adult' if age 18-64, 'senior' if 65+

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.map do |name, demo|
  age_group = if demo["age"].between?(0, 17)
                "kid"
              elsif demo["age"].between?(18, 64)
                "adult"
              elsif demo["age"] >= 65
                "senior"
              end
  demo["age_group"] = age_group
end

munsters

