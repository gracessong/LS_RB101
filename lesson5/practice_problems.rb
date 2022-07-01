# Practice Problem 1

arr = ['10', '11', '9', '7', '8']

arr.sort { |a, b| b.to_i <=> a.to_i }

# =================================================== #

# Practice Problem 2

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by do |book|
  book[:published].to_i
end   

# Even though the years are strings, because they are all of 4 character-length,
# omitting #to_i will still yield the same result 

# =================================================== #

# Practice Problem 3

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
arr1[2][1][3] # => 'g'

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
arr2[1][:third][0] # => 'g'

arr3 = [['abc'], ['def'], {third: ['ghi']}]
arr3[2][:third][0][0] # => 'g'

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh1['b'][1] # => 'g'

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
hsh2[:third].key(0) # => 'g'; can reference a hash key through value 

# =================================================== #

# Practice Problem 4

arr1 = [1, [2, 3], 4]
arr1[1][1] = 4 # => 3 changed to 4

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4 # => 3 changed to 4

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4 # => 3 changed to 4

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4 # => 3 changed to 4

# =================================================== #

# Practice Problem 5

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_age = 0

munsters.each do |name, detail| # can also use #each_key 
  if detail["gender"] == "male"
    total_age += detail["age"]
  end
end

total_age

# =================================================== #

# Practice Problem 6

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, detail|
  puts "#{name} is a #{detail["age"]}-year-old #{detail["gender"]}."
end

# =================================================== #

# Practice Problem 7

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

# => a = 2; a is pointing to a non-mutable integer, so the object it points to 
# does not change. arr[0] referenes to the object in the array at index 0, not
# directly to the integer 2 itself, and arr[0] += 2 modifies the array by reassigning
# the value to integer 4, without changing variable a. 
# By doing so, instead of arr[0] containing a, it now contains the integer object 4.

# => b = [3, 8]; b is pointing to an array object, not the integer objects within.
# arr[1][0] -= a reassigns the object in arr[1][0] to 3. Therefore the element in 
# the array the variable b is pointing to is changed. 

# =================================================== #

# Practice Problem 8

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each_value do |array|
  array.each do |string|
    string.chars.each do |char|
      if %w(a e o i u).include?(char)
        puts char
      end
    end
  end
end

# =================================================== #

# Practice Problem 9

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |sub_arr|
  sub_arr.sort { |a, b| b <=> a }
end 

# =================================================== #

# Practice Problem 10

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
  hash.map {|key, value| [key, value + 1]}.to_h
end 

# or

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
  incremented_hsh = {}
  hash.each do |key, value|
    incremented_hsh[key] = value + 1 
  end
  incremented_hsh
end 

# =================================================== #

# Practice Problem 11

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.map do |sub_arr|
  sub_arr.select do |num|
    num % 3 == 0
  end
end 

# or using #reject

arr.map do |sub_arr|
  sub_arr.reject do |num|
    num % 3 != 0
  end
end

# =================================================== #

# Practice Problem 12

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

arr.each_with_object({}) do |sub_arr, hsh|
  hsh_key = sub_arr[0]
  hsh_value = sub_arr[1]
  hsh[hsh_key] = hsh_value # refactored: hsh[sub_arr[0]] = sub_arr[1]
end 

# =================================================== #

# Practice Problem 13

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end 
end 

# =================================================== #

# Practice Problem 14

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.values.map do |produce|
  if produce.values.include?('fruit')
    produce[:colors].map!{|color| color.capitalize}
  elsif produce.values.include?('vegetable')
    produce[:size].upcase
  end
end

# =================================================== #

# Practice Problem 15

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.select do |hsh|
  hsh.values.all? do |values|
    values.all? {|num| num.even? }
  end
end 

# =================================================== #

# Practice Problem 16

# Problem:
# input: no parameter
# output: a string of 32 hexadecimal characters, broken into 8-4-4-4-12 
# Explicit rules: 
# - string consists of a total of 32 random hexadecimal characters 
# - each place can hold a random character out of 16 hexadecimal characters
# - method does not require parameter
# Implicit rules:
# - alphabetical characters are in lower case

# Algorithm:
# - initialize an empty array
# - initialize the pool for available characters containing 1..9, a..f
# - for the first part, sample 8 characters and add to the empty array
# - add ['-'] to the array
# - for the next 3 parts, sample 4 characters for each and add to the array
# - add ['-'] to the array
# - for the last part, sample 12 characters and add
# - join all 

def create_uuid 
  array_uuid = []

  hexdec_chars = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 'a', 'b', 'c', 'd', 'e', 'f' ]

  array_uuid << hexdec_chars.sample(8)
  array_uuid << '-'
  3.times do 
    array_uuid << hexdec_chars.sample(4) 
    array_uuid << '-'
  end
  array_uuid << hexdec_chars.sample(12)

  array_uuid.join 
end 

create_uuid

# or using a bit more iterative methods...?

def create_uuid
  hexdec_chars = []
  (0..9).each { |num| hexdec_chars << num.to_s }
  ('a'..'f').each { |letter| hexdec_chars << letter }

  uuid = ''
  array_uuid = [8, 4, 4, 4, 12]
  array_uuid.each_with_index do | section, index | # learn to use each_with_index more!!!
    section.times do 
      uuid << hexdec_chars.sample
    end 
    uuid << '-' unless index == array_uuid.size - 1
  end

  uuid 
end

