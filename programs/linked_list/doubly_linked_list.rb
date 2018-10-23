class Node
  attr_accessor :prev, :next, :value
  
  def initialize(value)
    @prev = nil
    @next = nil
    @value = value
  end
end

class DoublyLinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    node = Node.new(value)
    if @head
      old_tail = find_tail
      old_tail.next = node
      node.prev = old_tail
      node.next = nil
    else
      @head = node
    end
  end

  def prepend(value)
    node = Node.new(value)
    if @head
      @head.prev = node
      node.next = @head
      @head = node
    else
      @head = node
    end
  end

  def append_after(target, value)
    new_node = Node.new(value)
    if target_node = find(target)
      new_node.next = target_node.next
      target_node.next.prev = new_node if target_node.next
      target_node.next = new_node
      new_node.prev = target_node
    else
      puts 'Target node not found'
    end
  end

  def append_before(target, value)
    new_node = Node.new(value)
    if target_node = find(target)
      new_node.next = target_node
      new_node.prev = target_node.prev
      target_node.prev = new_node
      new_node.prev.next = new_node
    else
      puts 'Target node not found'
    end
  end
  
  def find(value)
    node = @head
    return node if node.value == value
    return false if !node.next
    while node = node.next
      return node if node.value == value
    end
    false
  end
  
  def find_tail
    node = @head
    return node if !node.next
    while node = node.next
      return node if !node.next
    end
  end

  def delete_head
    @head = @head.next
    @head.prev = nil
  end

  def delete_tail
    tail = find_tail
    tail.prev.next = nil
  end
  
  def delete(value)
    node = find(value)
    node.prev.next = node.next if node.prev
    node.next.prev = node.prev if node.next
  end
  
  
  def print
    node = @head
    if node
      printable_string = "()[#{node.value}](#{node.next&.value})"
      while node = node.next
        printable_string << " <-> (#{node.prev&.value})[#{node.value}](#{node.next&.value})"
      end
    else
      puts 'Emply Doubly Linked List'
    end
    puts printable_string
  end
end

a = DoublyLinkedList.new
puts '--- appending nodes(2,3,4) -----'
a.append(2)
a.append(3)
a.append(4)
a.print
puts '--- prepend node(1) -----'
a.prepend(1)
a.print
puts '--- append_after(target=3, value=5) -----'
a.append_after(3, 5)
a.print
puts '--- append_before(target=3, value=5) -----'
a.append_before(3, 5)
a.print
puts '--- deleting head -----'
a.delete_head
a.print
puts '--- deleting tail -----'
a.delete_tail
a.print
puts '--- deleting node(3) -----'
a.delete(3)
a.print