require_relative '../exceptions/exceptions.rb'

class Stack
  attr_accessor :top, :size

  def initialize(size)
    @top = -1
    @size = size
    @array = Array.new(size)
  end

  def push(item)
    if @top == @size - 1
      raise StackOverflow.new('There is no space left with stack to fill in!')
    else
      @top += 1
      @array[top] = item
    end
    print
  end

  def pop
    if @top == -1
      raise StackUnderflow.new('There is nothing in stack to pop from!')
    else
      item = @array.delete_at(@top)
      @top -= 1
    end
    print
    item
  end
  
  def print
    printable_string = ""
    (0..@top).each do |index|
      printable_string << "[#{@array[index]}]"
    end
    puts '------------------------------'
    puts printable_string 
    puts '------------------------------'
  end
end