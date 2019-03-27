# Jane is hosting a birthday party. In order to treat her 
# guests fairly, she planned on seating them around a circular 
# table, in alphabetical order. Jane decided to write a program 
# to keep track of the table plan as her guests RSVP'd. She wanted to run the program as the guests 
# arrived and allow them to enter their name and find out who the two people the guest will be sitting 
# next to. Help Jane out by writing a class that will:

#Level 1:
# allow guests to be added via .add(name) in O(n) time
# allow guests to retrieve a 2 element list of the names of the guests seated next to them, 
# ordered [left, right] via .get(name) in O(n) time

# Level 2:

# implement a .delete(name) method that allows Jane to remove guests who dont 
# show up in O(n) time

# Level 3:
# increase the performance of any of the 3 methods to O(log n)


# Sample data: Psuedocode

# list = new JaneList();

# list.add("Jane");  // jane makes sure to include herself
# list.add("Fred");
# list.add("Mary");
# list.add("Bob");

# list.get("Fred")  -> ["Bob", "Jane"]

# list.delete("Bob");
# list.get("Fred")  -> ["Mary", "Jane"]

class LinkedNode

  attr_accessor :name, :next, :prev
  
  def initialize(name = nil)
    @name = name
    @next = nil
    @prev = nil
  end

  def append(name)
    new_node = LinkedNode.new(name)
    node = self
    while !node.next.nil?
      node = node.next
    end
    node.next = new_node
    new_node.prev = node
  end

  def to_s
    node = self 
    res = ''
    while !node.nil?
      if node.name.nil?
        name_s = 'nil' 
      else
        name_s = node.name
      end

      res += name_s + ' => '
      node = node.next
    end
    res
  end
end

class JaneList

  attr_accessor :names
  
  def initialize(name)
    @names = LinkedNode.new(name)
  end

  def add(name)

    return names.append(name) if names.nil? 
    
    previous = nil
    current = names
    new_name = LinkedNode.new(name)
 
    while current
      
      if previous.nil? && current.name >= name
        new_name.next = current
        current.prev = new_name
        break
      

      elsif name >= previous.name && (current.nil? || name <= current.name)

        new_name.next = current
        new_name.prev = previous
        previous.next = new_name
        current.prev = new_name
        break
        
      else
        previous = current
        current = current.next 
      end
      
    end

    names
    
  end

  def get(name)
    
  end

  def delete(name)
    
  end

end

jane = JaneList.new('Jane')
jane.add('Bob')
# names = jane.add('Jane')
puts jane.names.prev.to_s

# lk = LinkedNode.new('Jane')
# lk.append('Bob')
# puts lk

