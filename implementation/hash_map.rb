#  raise IndexError if index.negative? || index >= @buckets.length
require_relative '../linked_list/linked_list.rb'

class HashMap

  def initialize(load_factor, capacity)
    @load_factor = load_factor
    @capacity = capacity
    @hash_map = Array.new(16) {LinkedList.new}
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
      index.value = value
    else
      list.append(key, value)
    end

    
    # TODO: REMEMBER TO DO THE LOAD FACTOR INCREASE IN THIS METHOD LATER ON
    #
    #
    #
    #
    #
    #
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