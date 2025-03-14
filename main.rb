require_relative 'implementation/hash_map.rb'

# test = HashMap.new(0.75, 16)

# test.set('apple', 'red')
# test.set('banana', 'yellow')
# test.set('carrot', 'orange')
# test.set('dog', 'brown')
# test.set('elephant', 'gray')
# test.set('frog', 'green')
# test.set('grape', 'purple')
# test.set('hat', 'black')
# test.set('ice cream', 'white')
# test.set('jacket', 'blue')
# test.set('kite', 'pink')
# test.set('lion', 'golden')

# puts test

# puts test.get('ice cream')
# puts test.get('should be nil')

# puts test.has?('apple')
# puts test.has?('jacket')
# puts test.has?('does not exist')

# puts test.length
# p test.keys
# p test.values
# p test.entries

# test.remove('apple')
# p test.remove('fjdaf')
# test.remove('grape')
# test.remove('lion')

# puts test
# puts test.length
# p test.keys
# p test.values
# p test.entries

# test.clear 
# puts test

test = HashMap.new(0.75, 16)

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')
puts test

test.set('apple', 'new_red')
test.set('kite', 'new_pink')
test.set('lion', 'new_golden')
puts test

test.set('moon', 'silver')
puts test

test.set('hat', 'second_new_black')
test.set('jacket', 'second_new_blue')
test.set('moon', 'second_new_silver')
puts test

puts test.get('ice cream')
puts test.has?('elephant')
test.remove('apple')
puts test
puts test.length
p test.keys
p test.values
p test.entries
test.clear
puts test


