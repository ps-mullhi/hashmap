#  raise IndexError if index.negative? || index >= @buckets.length
require_relative '../linked_list/linked_list.rb'

class HashMap

  def initialize(load_factor, capacity)
    @load_factor = load_factor
    @capacity = capacity
    @hash_map = Array.new(capacity) {LinkedList.new}
  end

  # function from https://www.theodinproject.com/lessons/ruby-hashmap
  # Focus of this assignment isn't to come up with hashing functions. 
  # Note: This only hashes strings, but that is fine for this case.
  def hash(key)
    hash_code = 0
    prime_number = 31
       
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
       
    hash_code
  end

  def set(key, value)
    list = get_bucket_list(key)

    if list.contains?(key)
      index = list.find(key)
      node = list.at(index)
      node.value = value
    else
      list.append(key, value)
    end

    if self.length > @load_factor * @capacity
      grow_buckets
    end
  end

  def grow_buckets
    @capacity *= 2
    entries = self.entries
    @hash_map = Array.new(@capacity) {LinkedList.new}

    entries.each {|entry| self.set(entry[0], entry[1])}
  end

  def get(key)
    list = get_bucket_list(key)

    index = list.find(key)
    if index == -1
      nil
    else
      list.at(index).value
    end
  end

  def has?(key)
    list = get_bucket_list(key)

    list.contains?(key)
  end

  def remove(key)
    unless has?(key)
      return nil
    end

    list = get_bucket_list(key)
    index = list.find(key)
    list.remove_at(index)
  end

  def length
    count = 0

    @hash_map.each {|list| count += list.size}

    count
  end

  def clear
    @hash_map = Array.new(@capacity) {LinkedList.new}
  end

  def keys
    keys = Array.new

    @hash_map.each do |list|
      keys += list.all_keys
    end

    keys
  end

  def values
    values = Array.new

    @hash_map.each do |list|
      values += list.all_values
    end

    values
  end

  def entries
    keys = self.keys
    values = self.values

    keys.zip(values)
  end
 
  def to_s
    @hash_map.each_with_index {|list, i| puts "#{i}: #{list}"}
  end

  private

  def get_bucket_list(key)
    hash = hash(key)
    bucket = hash % @capacity
    raise IndexError if bucket.negative? || bucket >= @hash_map.length
    list = @hash_map[bucket]

    list
  end
end