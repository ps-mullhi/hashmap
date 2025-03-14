require_relative 'implementation/hash_map.rb'

# list = LinkedList.new

# list.append(10)
# list.append(20)
# list.append(30)

# puts list

# node = list.at(list.find(10))
# node.value = 50

# p node

# puts list

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

puts test.get('ice cream')
puts test.get('should be nil')

puts test.has?('apple')
puts test.has?('jacket')
puts test.has?('does not exist')

puts test.length
p test.keys

test.remove('apple')
p test.remove('fjdaf')
test.remove('grape')
test.remove('lion')

puts test
puts test.length
p test.keys

test.clear 
puts test


