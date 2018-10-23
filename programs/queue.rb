=begin
  Queue(FIFO) implementation with array
=end

require_relative '../programs/singly_linked_list.rb'

class QueueWithArray
  attr_accessor :front, :rear, :size, :capacity

  def initialize(capacity)
    @front = 0
    @rear = 0
    @size = 0
    @capacity = capacity
    @array = Array.new(capacity)
  end

  def enqueue(data)
    if @size == @capacity
      raise 'Overflow'
    else
      @size += 1
      @array[@rear] = data
      @rear = (@rear + 1) % @capacity
    end
  end

  def dequeue
    if @size == 0
      raise 'Underflow'
    else
      @size -= 1
      data = @array[@front % @capacity]
      @array[@front] = nil
      @front = (@front + 1) % @capacity
      data
    end
  end

  def inEmpty?
    @size.zero?
  end

  def isFull?
    @size == @capacity
  end
  
  def print
    printable = '['
    (0..@size).each do |index|
      printable += @array[(@front + index) % @capacity].to_s
      if index < (@size - 1)
        printable += ', '
      end
    end
    printable += ']'
    puts printable
  end
end

a = QueueWithArray.new(10)
a.enqueue(1)
a.print
a.enqueue(2)
a.print
a.enqueue(3)
a.print
a.dequeue
a.print

class QueueWithLinkedList
  attr_accessor :front, :rear, :length, :linked_list
  
  def initialize
    @length = 0
    @rear = nil
    @front = nil
    @linked_list = LinkedList.new
  end

  def enqueue(data)
    node = Node.new(data)
    @linked_list.append(data)
    if @linked_list.size == 1
      @front = node
    else
      @rear = node    
    end
    @length += 1
  end

  def dequeue
    if @linked_list.size == 0
      raise 'Underflow'
    else
      data = @front.value      
      @linked_list.delete(data)
      @front = @linked_list.head
      @length -= 1
      if @length == 0
        @rear = nil
      end      
      data
    end
  end

  def print
    @linked_list.print
  end  
end