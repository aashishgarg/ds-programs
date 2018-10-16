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
  
end
