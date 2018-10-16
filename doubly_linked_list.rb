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

  def find_tail
    node = @head
    return node if !node.next
    while node = node.next
      return node if !node.next
    end
  end
  
  def print
    node = @head
    if node
      printable_string = "()[#{node.value}](#{node.next&.value})"
      while node = node.next
        printable_string << " -> (#{node.prev&.value})[#{node.value}](#{node.next&.value})"
      end
    else
      puts 'Emply Doubly Linked List'
    end
    puts printable_string
  end
end