[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]

#1: #select called on array. No side effect. Returns a new array [{:c => "cat"}], not used
#1-5: outer block called on the array. No side effect. Returns a new hash = , used by the #select
#2-4: inner block called on the hash within the array. No side effect. Returns boolean
#2: #all? method called on hash. No side effect. Returns boolean value, used by the outer block to determine
# if #select critiera met
#3: comparison == called for the two arguments, first letter of value and string conversion of the key. 
# No side effect. Returns boolean value, used by the .all? method 
