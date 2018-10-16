class Node
  attr_accessor :next
  attr_reader :value

  def initialize(value)
    @value = value
    @next = nil
  end

  def to_s
    "Node with value: #{@value}"
  end
end

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    node = Node.new(value)
    if @head
      find_tail.next = node
    else
      @head = node
    end
  end

  def find_tail
    node = @head
    return node if !node.next
    while(node = node.next)
      return node if !node.next
    end
  end

  def append_after(target, value)
    node = find(target)
    return unless node
    old_next = node.next
    node.next = Node.new(value)
    node.next.next = old_next
  end

  def delete(value)
    if @head.value == value
      @head = @head.next
      return
    end
    node = find_before(value)
    node.next = node.next.next
  end

  def find(value)
    node = @head

    return false if !node.next
    return node if node.value == value

    while(node = node.next)
      return node if node.value == value
    end
  end

  def find_before(value)
    node = @head
    return false if !node.next
    return @head if @head.next.value == value

    while(node = node.next)
      return node if node.next && node.next.value == value
    end
  end

  def print
    node = @head
    if node
      to_be_printed = "#{node.value} "
      while(node = node.next)
        to_be_printed << " -> #{node.value}"
      end
      puts to_be_printed
    else
      puts 'Empty Linked list'
    end
  end

  def size
    return 0 if @head.nil?
    node = @head
    length = 0
    return 1 if !node.next
    while(node = node.next)
      length += 1
    end
    length
  end

  def delete_list
    @head = nil
    # node = @head
    # while node = node.next
    #   @head = node.next
    # end
  end
end
