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
