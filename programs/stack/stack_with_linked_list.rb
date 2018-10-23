=begin
Push operation is implemented by inserting element at the beginning of the list. 
Pop operation is implemented by deleting the node from the beginning (the header/top node).
=end
require_relative '../exceptions/exceptions.rb'

class Node
  attr_accessor :value, :next
  def initialize(value)
    @value = value
    @next = nil
  end
end

class Stack
  attr_accessor :head, :length
  
  def initialize
    @head = nil
    @length = 0
  end

  def push(value)
    node = Node.new(value)
    node.next = @head unless @head.nil?
    @head = node
    @length += 1
  end

  def pop
    if @head
      popped = @head
      @head = @head.next
      @length -= 1
    else
      raise StackUnderflow.new('There is nothing in stack to pop from!')
    end
    popped.value
  end

  def print
    node = @head
    if node
      to_be_printed = "[#{node.value}]"
      while(node = node.next)
        to_be_printed << "[#{node.value}]"
      end
      puts to_be_printed
    else
      puts 'Empty Stack'
    end
  end
end