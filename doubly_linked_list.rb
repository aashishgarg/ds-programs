class Node
  attr_accessor :prev, :next, :value
  
  def initialize(value)
    @prev = nil
    @next = nil
    @value = value
  end

  def to_s
    "Node with value: #{@value}"
  end
end

class DoublyLinkedList
  def initialize
    
  end
end