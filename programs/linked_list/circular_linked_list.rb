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

class CircularLinkedList
  attr_accessor :head, :current

  def initialize
    @head = nil
    @current = nil
  end

  def append(value)
    node = Node.new(value)
    if @head
      tail = find_tail
      tail.next = node
      node.next = @head
    else
      @head = node
      @current = node
    end
  end

  def prepend(value)
    node = Node.new(value)
    if @head
      tail = find_tail
      tail.next = node
      node.next = @head
      @head = node
    else
      @head = node
      @current = node
    end
  end
  
  def append_after(target, value)
    node = Node.new(value)
    target_node = find(target)
    if target_node
      node.next = target_node.next
      target_node.next = node      
    else
      puts 'Target not found'
    end 
  end

  def find(value)
    node = @head
    node = @current
    return @current if @current.value == value
    while @current = @current.next
      return @current if @current.value == value
      return false if @current == @head
    end
  end
  
  def find_tail
    @current = @head
    return @current unless @current.next
    while @current = @current.next
      return @current if @current.next == @head
    end
  end

  def print
    @current = @head
    printable_string = "#{@current.value}"
    while @current = @current.next
      if @current.next == @head
        printable_string << " -> #{@current.value}(pointing back to head #{@head.value})"
        puts printable_string
        return false
      else
        printable_string << " -> #{@current.value}"
      end
    end  
  end 
  
  def delete_last
    @current = @head
    return false unless @current.next
    while @current = @current.next
      if @current.next.next == @head
        @current.next = @head 
        return false
      end  
    end    
  end

  def delete_head
    next_to_head = @head.next
    find_tail.next = next_to_head
    @head = next_to_head
  end

  def delete(value)
    node = @head
    @current = node
    while @current = @current.next
      if @current.next.value == value
        @current.next = @current.next.next
        return false
      end
    end  
  end
end
